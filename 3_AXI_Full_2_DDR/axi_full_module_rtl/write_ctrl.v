`timescale 1ns / 1ps

module write_ctrl #(
	parameter   USER_WR_DATA_WIDTH	=	16	,
	parameter	AXI_DATA_WIDTH		=	128	,
	parameter   AXI_ADDR_WIDTH		=	32
)(
	/************* 全局控制信号 ****************************************************/
	input	wire								clk					,//用户端写时钟
	input	wire								rst_n				,//全局复位
	/*使能信号，用于模块启动 & DDR初始化完成 ...*/	
	input	wire 								wr_channel_en		,

	/************* 用户控制信号 ****************************************************/
	input	wire								user_wr_en			,
	input	wire								user_wr_last		,//指示用户端一波数据里面最后一个数据
	input	wire	[USER_WR_DATA_WIDTH-1:0]	user_wr_data		,
	input	wire	[AXI_ADDR_WIDTH-1:0]		user_wr_addr		,//每一次AXI4写突发的起始地址
    input   wire    [12:0]                      user_wr_length      ,//每一次突发的字节数据

	/************* write_buffer 交互 ****************************************************/
	output	reg									wr_req_en			,
	output	reg		[7:0]						wr_burst_length		,
	output	reg		[AXI_ADDR_WIDTH-1:0]		wr_data_addr		,
	output	reg									wr_data_valid		,
	output	reg		[AXI_DATA_WIDTH-1:0]		wr_data_out			,
	output	reg									wr_data_last
);

localparam	WR_CNT_MAX			=	AXI_DATA_WIDTH / USER_WR_DATA_WIDTH - 1;

reg								rst_n_sync_d0	;
reg								rst_n_sync_d1	;
reg								rst_n_sync		;
reg								wr_channel_en_d0;
reg								wr_channel_en_d1;
reg								ddr_wr_enable   ;
reg								user_wr_en_d    ;
reg								user_wr_last_d  ;
reg [USER_WR_DATA_WIDTH-1:0]    user_wr_data_d  ;
reg [AXI_ADDR_WIDTH-1:0]        user_wr_addr_d  ;
reg [12:0]                      user_wr_length_d;

reg [$clog2(WR_CNT_MAX) - 1 :0] wr_cnt          ;
reg [7:0]                       wr_burst_cnt    ;

reg                             err_4k          ;//出现4k边界错误
reg                             err_addr        ;//地址错误

/************* CDC打拍处理 ****************************************************/
always@(posedge clk)begin
	rst_n_sync_d0		<=	rst_n				;
	rst_n_sync_d1		<=	rst_n_sync_d0		;
	rst_n_sync   		<=	rst_n_sync_d1		;    
end

always@(posedge clk)begin
	wr_channel_en_d0	<=	wr_channel_en		;
	wr_channel_en_d1	<=	wr_channel_en_d0	;
	ddr_wr_enable   	<=	wr_channel_en_d1	;
end

always@(posedge clk)begin
    if (ddr_wr_enable) begin
		user_wr_en_d		<=	user_wr_en		;
		user_wr_data_d		<=	user_wr_data	;
		user_wr_last_d		<=	user_wr_last	;
		user_wr_addr_d		<=	user_wr_addr	;
        user_wr_length_d    <=  user_wr_length  ;
    end  
    else begin
		user_wr_en_d		<=	0               ;
        user_wr_last_d		<=	0				;
        user_wr_data_d		<=	user_wr_data_d	;
        user_wr_addr_d		<=	user_wr_addr_d	;
        user_wr_length_d    <=  user_wr_length_d;
    end 
end

/************* 计数器 ****************************************************/
always@(posedge clk)begin
    if (!rst_n_sync) 
        wr_cnt	<=	0	;
    else if (user_wr_last_d) 
        wr_cnt	<=	0	;
    else if (user_wr_en_d && wr_cnt == WR_CNT_MAX)
        wr_cnt <= 0;
    else if (user_wr_en_d) 
        wr_cnt <= wr_cnt + 1'b1;
    else 
        wr_cnt <= wr_cnt;    
end

always@(posedge clk)begin
    if (!rst_n_sync) 
        wr_burst_cnt <= 0;
    else if (user_wr_last_d) 
        wr_burst_cnt <= 0;
    else if (user_wr_en_d && wr_cnt == WR_CNT_MAX)
        wr_burst_cnt <= wr_burst_cnt + 1'b1;
    else 
        wr_burst_cnt <= wr_burst_cnt;
end

/************* 数据控制 ****************************************************/
always@(posedge clk)begin
    if (wr_cnt == WR_CNT_MAX && user_wr_en_d) 
        wr_data_valid <= 1'b1;
    else 
        wr_data_valid <= 0; 
end

always@(posedge clk)begin
    if (user_wr_en_d) 
		wr_data_out <= {user_wr_data_d,wr_data_out[AXI_DATA_WIDTH-1 : USER_WR_DATA_WIDTH]}; 
	else 
		wr_data_out <= wr_data_out;
end

always@(posedge clk)begin
    if (user_wr_last_d)
        wr_data_last <= 1'b1;
    else 
        wr_data_last <= 0; 
end

/************* 数据写请求 ****************************************************/
always@(posedge clk)begin
    if (user_wr_last_d)
        wr_req_en <= 1'b1;
    else 
		wr_req_en <= 0; 
end

always@(posedge clk)begin
    if (!rst_n_sync) 
        wr_data_addr <= 0;
    else if (user_wr_en_d)
        wr_data_addr <= user_wr_addr_d;
end

always@(posedge clk)begin
    if (!rst_n_sync) 
        wr_burst_length <= 0;
    else if (user_wr_en_d)
        wr_burst_length <= user_wr_length_d / (AXI_DATA_WIDTH / 8) - 1;
    else 
        wr_burst_length <= wr_burst_length;
end

/************* 调试信号 ****************************************************/
always@(posedge clk)begin
    if (!rst_n_sync) 
        err_4k <= 0;
    else if (user_wr_en_d && (user_wr_addr[11:0] +  user_wr_length_d) > 4096) 
        err_4k <= 1'b1;
    else 
        err_4k <= err_4k;
end

always@(posedge clk)begin
    if (!rst_n_sync) 
        err_addr <= 0;
    else if (user_wr_en_d && user_wr_addr[$clog2(AXI_DATA_WIDTH/8) : 0]) 
        err_addr <= 1'b1;
    else 
        err_addr <= err_addr;
end

endmodule

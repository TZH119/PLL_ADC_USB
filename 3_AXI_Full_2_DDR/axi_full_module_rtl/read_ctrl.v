`timescale 1ns / 1ps

module read_ctrl#(
	parameter	AXI_DATA_WIDTH		=	128	,
	parameter	AXI_ADDR_WIDTH		=	32	
)(
	/************* 全局控制信号 ****************************************************/
	input	wire								clk					,//用户端写时钟
	input	wire								rst_n				,//全局复位
	/*使能信号，用于模块启动 & DDR初始化完成 ...*/	
	input	wire 								rd_channel_en		,

    /************* 用户控制信号 ****************************************************/
	input 	wire								user_rd_req			,//上升沿触发用户读请求
	input 	wire	[AXI_ADDR_WIDTH-1:0]		user_rd_addr		,
	input 	wire	[12:0]						user_rd_length		,
	output	wire								user_rd_req_busy	,//用户读请求忙标志

	/************* read_buffer 交互 ****************************************************/
	output	reg									rd_req_en			,
	output	reg		[7:0]						rd_burst_length		,
	output	reg		[AXI_ADDR_WIDTH-1:0]		rd_data_addr		,
	input	wire								rd_req_ready		 //用来指示rd_buffer模块里面的cmd_fifo是否爆满
);

/************* 状态机 ****************************************************/
localparam  RD_IDLE = 2'b00	;
localparam  RD_REQ  = 2'b01	;
localparam  RD_END  = 2'b10	;

reg	[1:0]					cur_status		;
reg	[1:0]					nxt_status		;
reg							rst_n_sync_d0	;
reg							rst_n_sync_d1	;
reg							rst_n_sync		;
reg                         rd_channel_en_d0;
reg                         rd_channel_en_d1;
reg                         ddr_rd_enable   ;
reg                         user_rd_req_d0  ;
reg                         user_rd_req_d1  ;
reg                         rd_req_trig     ;
reg [AXI_ADDR_WIDTH-1:0]    user_rd_addr_d  ;
reg [12:0]                  user_rd_length_d;

reg                         err_4k          ; //出现4k边界错误
reg                         err_addr        ; //地址错误

wire                        user_rd_req_rise;

assign user_rd_req_busy = cur_status != RD_IDLE;
assign user_rd_req_rise = user_rd_req_d0 & ~user_rd_req_d1;

/************* CDC打拍处理 ****************************************************/
always @(posedge clk) begin
    rst_n_sync_d0 <= rst_n;
    rst_n_sync_d1 <= rst_n_sync_d0;
    rst_n_sync    <= rst_n_sync_d1;    
end

always @(posedge clk) begin
    rd_channel_en_d0 <= rd_channel_en;
    rd_channel_en_d1 <= rd_channel_en_d0;
    ddr_rd_enable    <= rd_channel_en_d1;
end

always @(posedge clk) begin
    user_rd_req_d0 <= user_rd_req;
    user_rd_req_d1 <= user_rd_req_d0;
end

always @(posedge clk) begin
    if (ddr_rd_enable) 
        rd_req_trig <= user_rd_req_rise; 
    else 
        rd_req_trig <= 0;
end

always @(posedge clk) begin
    if (user_rd_req_rise) begin
        user_rd_addr_d   <= user_rd_addr;
        user_rd_length_d <= user_rd_length;
    end
    else begin
        user_rd_addr_d   <= user_rd_addr_d;
        user_rd_length_d <= user_rd_length_d;
    end
end

/************* 状态机 ****************************************************/
always @(posedge clk) begin
    if (~rst_n_sync) 
        cur_status <= RD_IDLE;
    else 
        cur_status <= nxt_status;
end

always @(*) begin
    if (~rst_n_sync) 
        nxt_status <= RD_IDLE;
    else begin
        case(cur_status)
            RD_IDLE : begin
                if (rd_req_trig) 
                    nxt_status <= RD_REQ;
                else 
                    nxt_status <= cur_status;
            end
            RD_REQ : begin
                if (rd_req_en && rd_req_ready) 
                    nxt_status <= RD_END;
                else 
                    nxt_status <= cur_status;
            end
            RD_END : begin
                nxt_status <= RD_IDLE;
            end
            default : nxt_status <= RD_IDLE;
        endcase
    end
end

/************* 读数据请求 ****************************************************/
always @(posedge clk) begin
    if (rd_req_en && rd_req_ready) 
		rd_req_en <= 0; 
	else if (cur_status == RD_REQ) 
		rd_req_en <= 1; 
	else 
		rd_req_en <= rd_req_en;
end

always @(posedge clk) begin
    if (rd_req_trig)
        rd_data_addr <= user_rd_addr_d;
    else 
        rd_data_addr <= rd_data_addr;
end

always @(posedge clk) begin
    if (~rst_n_sync) 
        rd_burst_length <= 0;
    else if (rd_req_trig)
        rd_burst_length <= user_rd_length_d / (AXI_DATA_WIDTH / 8) - 1;
    else 
        rd_burst_length <= rd_burst_length;
end

/************* 调试信号 ****************************************************/
always @(posedge clk) begin
    if (~rst_n_sync) 
        err_4k <= 0;
    else if (user_rd_req_d0 && (user_rd_addr[11:0] +  user_rd_length_d) > 4096) 
        err_4k <= 1'b1;
    else 
        err_4k <= err_4k;
end

always @(posedge clk) begin
    if (~rst_n_sync) 
        err_addr <= 0;
    else if (user_rd_req_d0 && user_rd_addr[$clog2(AXI_DATA_WIDTH/8) : 0]) 
        err_addr <= 1'b1;
    else 
        err_addr <= err_addr;
end

endmodule

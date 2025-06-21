`timescale 1ns / 1ps

module data_trans_ctrl #(
	parameter	USER_WR_DATA_WIDTH  =   16  			,
	parameter	USER_RD_DATA_WIDTH  =   16  			,
	parameter	AXI_ADDR_WIDTH      =   32  			,
	parameter	WR_BASEADDR			=   32'h0000_0000	,
	parameter	RD_BASEADDR			=   32'h0000_0000	,
	parameter	SINGLE_WR_LENGTH	=	2048 			,//一次性传输2048个数据
	parameter	SINGLE_RD_LENGTH	=	2048 			,//一次性传输2048个数据
	parameter	TOTAL_WR_LENGTH		=	20480			,//总共传输20480个数据
	parameter	TOTAL_RD_LENGTH		=	20480			 //总共传输20480个数据
)(
	/************* 用户控制信号 ****************************************************/
	input	wire                                wr_clk          ,
	input   wire                                rd_clk          ,
	input   wire                                rst_n           ,
	//读写脉冲输入
	input	wire								write_signal	,	
	input	wire								read_signal		,
	//读写状态指示
	output	wire								write_done		,
	output	wire								read_done		,
	output	reg									write_task_busy	,
	output	reg									read_task_busy	,
	//数据输入输出
	input	wire    [USER_WR_DATA_WIDTH-1:0]    write_data		,
	output	wire    [USER_RD_DATA_WIDTH-1:0]    read_data		,

	/************* AXI时钟信号 ****************************************************/
	input   wire                                axi_clk         ,

	/************* 传输交互信号 ****************************************************/
	//写
	output	reg 							    user_write_vld	,
	output  reg                                 user_wr_last    ,
	output  reg     [12:0]                      user_wr_length  ,
	output  reg     [AXI_ADDR_WIDTH-1:0]        user_wr_addr    ,
	output  wire    [USER_WR_DATA_WIDTH-1:0]    user_wr_data    ,
	//读
	output  reg                                 user_read_vld	,
	input	wire                                user_rd_last    ,
	output  reg     [12:0]                      user_rd_length  ,
	output  reg     [AXI_ADDR_WIDTH-1:0]        user_rd_addr	,
	input	wire    [USER_RD_DATA_WIDTH-1:0]    user_rd_data
);

/************* 信号定义 ****************************************************/
localparam	PERIOD				=	0														;
//地址计算
localparam  WR_ENDADDR			=   WR_BASEADDR	+ TOTAL_WR_LENGTH * (USER_WR_DATA_WIDTH / 8)	;
localparam  RD_ENDADDR			=   RD_BASEADDR	+ TOTAL_RD_LENGTH * (USER_RD_DATA_WIDTH / 8)	;
//延时复位信号
reg		[11:0]	wr_reset_timer  ;
reg		      	wr_rst_n_sync   ;
reg		[19:0]	wr_cnt          ;
reg		[19:0]	rd_cnt          ;
//读写脉冲检测
reg 		write_signal_d0	;
reg 		read_signal_d0	;
wire		write_signal_pos;
wire		read_signal_pos	;
assign	write_signal_pos	=	(~write_signal_d0	&&	write_signal		);
assign	read_signal_pos		=	(~read_signal_d0	&&	read_signal			);
//读写状态
assign	write_done			=	(user_wr_last && user_wr_addr == WR_ENDADDR);
assign	read_done 			=	(user_rd_last && user_rd_addr == RD_ENDADDR);
//待传输数据 & 已接收数据
assign	user_wr_data		=	write_data									;
assign	read_data			=	user_rd_data								;

/************* 读写状态标记 ****************************************************/
always @(posedge wr_clk) begin
	if (~wr_rst_n_sync)
		write_task_busy <= 0;
	else if(write_signal_pos)
		write_task_busy <= 1;
	else if(write_done)
		write_task_busy <= 0;
end

always @(posedge rd_clk) begin
	if (~wr_rst_n_sync)
		read_task_busy <= 0;
	else if(read_signal_pos)
		read_task_busy <= 1;
	else if(read_done)
		read_task_busy <= 0;
end

/************* 延时复位信号控制 ****************************************************/
always @(posedge wr_clk) begin
	if (~rst_n) begin
		wr_reset_timer <= 12'h0;
		wr_rst_n_sync  <= 1'b0;	
	end
	else if (wr_reset_timer <= 'd1000) begin
		wr_reset_timer <= wr_reset_timer + 1;
		wr_rst_n_sync  <= 1'b0;
	end
	else begin
		wr_reset_timer <= wr_reset_timer;
		wr_rst_n_sync  <= 1'b1;		
	end
end

/************* 读写脉冲检测 ****************************************************/
always @(posedge wr_clk) begin
	write_signal_d0 <= write_signal;
end
always @(posedge rd_clk) begin
	read_signal_d0 <= read_signal;
end

/************* 有效区域设定 ****************************************************/
always @(posedge wr_clk) begin
	if (~wr_rst_n_sync || ~write_task_busy) 
		user_write_vld <= 0;
	else if (write_done)
		user_write_vld <= 0;
	else if (wr_cnt == 0)
		user_write_vld <= 1;
end

always @(posedge rd_clk) begin
	if (~wr_rst_n_sync || ~read_task_busy) 
		user_read_vld <= 0;
	else if (user_rd_last || read_done)
		user_read_vld <= 0;
	else if (rd_cnt == 0) 
		user_read_vld <= 1;
end

/************* WR 信号控制 ****************************************************/
always @(posedge wr_clk) begin
	if (~wr_rst_n_sync || ~write_task_busy) 
		wr_cnt <= 'd0;
	else if (wr_cnt == SINGLE_WR_LENGTH + PERIOD - 1) 
		wr_cnt <= 'd0;
	else
		wr_cnt <= wr_cnt + 1'b1;
end

always @(posedge wr_clk) begin
    if (~wr_rst_n_sync || ~write_task_busy) 
        user_wr_last <= 0;
    else if (wr_cnt == SINGLE_WR_LENGTH - 1) 
        user_wr_last <= 1'b1;
    else 
        user_wr_last <= 0; 
end

always @(posedge wr_clk) begin
    if (~wr_rst_n_sync || ~write_task_busy) 
        user_wr_length <= 0; 
    else 
        user_wr_length <= SINGLE_WR_LENGTH * (USER_WR_DATA_WIDTH / 8);
end

always @(posedge wr_clk) begin
    if (~wr_rst_n_sync || ~write_task_busy) 
        user_wr_addr <= WR_BASEADDR; //起始地址从0开始
    else if (user_wr_last && user_wr_addr == WR_ENDADDR) 
        user_wr_addr <= user_wr_addr;
    else if (user_wr_last)
        user_wr_addr <= user_wr_addr + SINGLE_WR_LENGTH * (USER_WR_DATA_WIDTH / 8);
    else 
        user_wr_addr <= user_wr_addr;
end

/************* RD 信号控制 ****************************************************/
always @(posedge rd_clk) begin
	if (~wr_rst_n_sync || ~read_task_busy) 
		rd_cnt <= 'd0;
	else if (rd_cnt == SINGLE_RD_LENGTH + PERIOD - 1) 
		rd_cnt <= 'd0;
	else
		rd_cnt <= rd_cnt + 1'b1;
end

always @(posedge rd_clk) begin
    if (~wr_rst_n_sync || ~read_task_busy)
        user_rd_length <= 0;
    else 
        user_rd_length <= SINGLE_RD_LENGTH * (USER_RD_DATA_WIDTH / 8);
end

always @(posedge rd_clk) begin
    if (~wr_rst_n_sync || ~read_task_busy) 
        user_rd_addr <= RD_BASEADDR; //起始地址从0开始
    else if (user_rd_last && user_rd_addr == RD_ENDADDR) 
        user_rd_addr <= user_rd_addr;
    else if (user_rd_last)
        user_rd_addr <= user_rd_addr + SINGLE_RD_LENGTH * (USER_RD_DATA_WIDTH / 8);
    else 
        user_rd_addr <= user_rd_addr;
end

endmodule

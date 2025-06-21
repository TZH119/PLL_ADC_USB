`timescale 1ns / 1ps

module write_buffer #(
	parameter   AXI_DATA_WIDTH     = 128 ,
	parameter   AXI_ADDR_WIDTH     = 32  

)(
	/************* 全局控制信号 ****************************************************/
	input   wire                            clk                 ,//用户端写时钟
	input   wire                            axi_clk             ,//AXI4端时钟
	input   wire                            rst_n               ,

	/************* write_ctrl 交互 ****************************************************/
    input   wire                            wr_req_en           ,
    input   wire    [7:0]                   wr_burst_length     ,
    input   wire    [AXI_ADDR_WIDTH-1:0]    wr_data_addr        ,
    input   wire                            wr_data_valid       ,
    input   wire    [AXI_DATA_WIDTH-1:0]    wr_data_in          ,
    input   wire                            wr_data_last        , 

	/************* axi_wr_master 交互 ****************************************************/
    output  reg                             axi_aw_req_en       ,//表示AXI4写请求
    input   wire                            axi_aw_ready        ,//axi_aw_req_en 和axi_aw_ready同时为高，开启一次AXI4写传输
    output  reg     [7:0]                   axi_aw_burst_len    ,
    output  reg     [AXI_ADDR_WIDTH-1:0]    axi_aw_addr         ,

    output  reg                             axi_w_valid         ,
    input   wire                            axi_w_ready         ,
    output  reg     [AXI_DATA_WIDTH-1:0]    axi_w_data          ,
    output  reg                             axi_w_last          ,

    /************* 调试信号 ****************************************************/
    output  reg                             wr_cmd_fifo_err     ,
    output  reg                             wr_data_fifo_err
);

/************* CDC 信号定义 ****************************************************/
reg             rst_n_sync_d0       ;//用户端复位信号
reg             rst_n_sync_d1       ;
reg             rst_n_sync          ;
reg             a_rst_n_sync_d0     ;//axi4端的复位信号
reg             a_rst_n_sync_d1     ;
reg             a_rst_n_sync        ;

/************* FIFO 信号定义 ****************************************************/
//CMD
reg             cmd_wren            ;
wire    [39:0]  cmd_dout            ;
wire            cmd_rden            ;
wire            cmd_wrfull          ;
wire            cmd_rdempty         ;
wire    [4:0]   cmd_wrcount         ;
wire    [4:0]   cmd_rdcount         ;
reg	    [39:0]  cmd_din             ;
//数据
reg             data_wren           ;
reg             data_rden           ;
wire            data_wrfull         ;
wire            data_rdempty        ;

/************* 状态机 ****************************************************/
reg     [2:0]   cur_status          ;
reg     [2:0]   nxt_status          ;

localparam  WR_IDLE     =   3'b000  ;
localparam  WR_REQ      =   3'b001  ;
localparam  WR_DATA_EN  =   3'b010  ;
localparam  WR_DATA_END =   3'b100  ;

/************* CDC ****************************************************/
always @(posedge clk) begin
	rst_n_sync_d0 <= rst_n;
	rst_n_sync_d1 <= rst_n_sync_d0;
	rst_n_sync    <= rst_n_sync_d1;    
end

always @(posedge axi_clk) begin
	a_rst_n_sync_d0 <= rst_n;
	a_rst_n_sync_d1 <= a_rst_n_sync_d0;
	a_rst_n_sync    <= a_rst_n_sync_d1;    
end

/************* CMD和Length写入 ****************************************************/
always @(posedge clk) begin
    if (wr_req_en) begin
        cmd_wren <= 1'b1;
        cmd_din  <= {wr_burst_length,wr_data_addr};
    end
    else begin
        cmd_wren <= 0;
        cmd_din  <= 0;    	
    end  
end

/************* 状态机 ****************************************************/
always @(posedge axi_clk) begin
    if (~a_rst_n_sync) 
        cur_status <= WR_IDLE;
    else 
        cur_status <= nxt_status;
end

always @(*) begin
    if (~a_rst_n_sync) 
        nxt_status <= WR_IDLE;
    else begin
        case(cur_status)
            WR_IDLE : begin
                if (~cmd_rdempty)
                    nxt_status <= WR_REQ;
                else 
                    nxt_status <= cur_status;
            end
            WR_REQ : begin
                if (axi_aw_req_en && axi_aw_ready)	
                    nxt_status <= WR_DATA_EN;
                else 
                    nxt_status <= cur_status;
            end
            WR_DATA_EN : begin
                if (axi_w_valid && axi_w_ready && axi_w_last)
                    nxt_status <= WR_DATA_END;
                else 
                    nxt_status <= cur_status;
            end
            WR_DATA_END : begin
                nxt_status <= WR_IDLE;
            end
            default : nxt_status <= WR_IDLE;
        endcase
    end
end

always @(posedge axi_clk) begin
    if (~a_rst_n_sync) 
        axi_aw_req_en <= 0;
    else if (axi_aw_req_en && axi_aw_ready) 
        axi_aw_req_en <= 0;
    else if (cur_status == WR_REQ)
        axi_aw_req_en <= 1; 
    else 
        axi_aw_req_en <= axi_aw_req_en;
end

always @(*) begin
    if (~a_rst_n_sync) begin
        axi_aw_burst_len <= 0;
        axi_aw_addr      <= 0;
    end
    else begin
        axi_aw_burst_len <= cmd_dout[39:32];
        axi_aw_addr      <= cmd_dout[31:0] ;
    end
end

assign cmd_rden = axi_aw_req_en && axi_aw_ready;

/************* CMD FIFO ****************************************************/
fifo_w40xd16 wr_cmd_fifo (
    .rst            (~rst_n_sync    ),
    .wr_clk         (clk            ),
    .rd_clk         (axi_clk        ),
    .din            (cmd_din        ),
    .wr_en          (cmd_wren       ),
    .rd_en          (cmd_rden       ),
    .dout           (cmd_dout       ),
    .full           (cmd_wrfull     ),
    .empty          (cmd_rdempty    ),
    .rd_data_count  (cmd_rdcount    ),
    .wr_data_count  (cmd_wrcount    ) 
);

generate
	if (AXI_DATA_WIDTH == 256) begin
		reg  [287:0] data_din;
		wire [287:0] data_dout;
		wire [9:0]   data_wrcount;
		wire [9:0]   data_rdcount; 		

		always @(posedge clk) begin
			data_din  <= {31'h0,wr_data_last,wr_data_in};
			data_wren <= wr_data_valid;
		end
		
		always @(posedge axi_clk) begin
            if (axi_aw_req_en && axi_aw_ready) 
                axi_w_valid <= 1'b1;
            else if (axi_w_valid && axi_w_ready && axi_w_last) 
                axi_w_valid <= 0;
            else 
                axi_w_valid <= axi_w_valid; 
		end
		
		always @(*) begin
            if (data_rden) begin
                axi_w_data <= data_dout[255:0];
                axi_w_last <= data_dout[256];
            end
            else begin
                axi_w_data <= 0;
                axi_w_last <= 0;
            end 
		end
		
		always @(*) begin
			data_rden <= axi_w_valid && axi_w_ready && cur_status == WR_DATA_EN;
		end
		

		fifo_w288xd512 wr_data_fifo (
            .rst              (~rst_n_sync    ),
            .wr_clk           (clk            ),
            .rd_clk           (axi_clk        ),
            .din              (data_din       ),
            .wr_en            (data_wren      ),
            .rd_en            (data_rden      ),
            .dout             (data_dout      ),
            .full             (data_wrfull    ),
            .empty            (data_rdempty   ),
            .rd_data_count    (data_rdcount   ),
            .wr_data_count    (data_wrcount   ) 
        );

	end else if (AXI_DATA_WIDTH == 128) begin
		reg  [143:0] data_din;
		wire [143:0] data_dout;
		wire [9:0]   data_wrcount;
		wire [9:0]   data_rdcount; 		

		always @(posedge clk) begin
			data_din  <= {15'h0,wr_data_last,wr_data_in};
			data_wren <= wr_data_valid;
		end
		
		always @(posedge axi_clk) begin
            if (axi_aw_req_en && axi_aw_ready) 
                axi_w_valid <= 1'b1;
            else if (axi_w_valid && axi_w_ready && axi_w_last) 
                axi_w_valid <= 0;
            else 
                axi_w_valid <= axi_w_valid; 
		end
		
		always @(*) begin
            if (data_rden) begin
                axi_w_data <= data_dout[127:0];
                axi_w_last <= data_dout[128];
            end
            else begin
                axi_w_data <= 0;
                axi_w_last <= 0;
            end 
		end
		
		always @(*) begin
			data_rden <= axi_w_valid && axi_w_ready && cur_status == WR_DATA_EN;
		end
		

		fifo_w144xd512 wr_data_fifo (
            .rst              (~rst_n_sync    ),
            .wr_clk           (clk            ),
            .rd_clk           (axi_clk        ),
            .din              (data_din       ),
            .wr_en            (data_wren      ),
            .rd_en            (data_rden      ),
            .dout             (data_dout      ),
            .full             (data_wrfull    ),
            .empty            (data_rdempty   ),
            .rd_data_count    (data_rdcount   ),
            .wr_data_count    (data_wrcount   ) 
		);

	end else if (AXI_DATA_WIDTH == 64) begin
		reg  [71:0] data_din;
		wire [71:0] data_dout;
		wire [9:0]  data_wrcount;
		wire [9:0]  data_rdcount; 		

		always @(posedge clk) begin
			data_din  <= {7'h0,wr_data_last,wr_data_in};
			data_wren <= wr_data_valid;
		end
		
		always @(posedge axi_clk) begin
            if (axi_aw_req_en && axi_aw_ready) 
                axi_w_valid <= 1'b1;
            else if (axi_w_valid && axi_w_ready && axi_w_last) 
                axi_w_valid <= 0;
            else 
                axi_w_valid <= axi_w_valid; 
		end
		
		always @(*) begin
            if (data_rden) begin
                axi_w_data <= data_dout[63:0];
                axi_w_last <= data_dout[64];
            end
            else begin
                axi_w_data <= 0;
                axi_w_last <= 0;
            end 
		end
		
		always @(*) begin
			data_rden <= axi_w_valid && axi_w_ready && cur_status == WR_DATA_EN;
		end
		
		fifo_w72xd512 wr_data_fifo (
            .rst            (~rst_n_sync    ),
            .wr_clk         (clk            ),
            .rd_clk         (axi_clk        ),
            .din            (data_din       ),
            .wr_en          (data_wren      ),
            .rd_en          (data_rden      ),
            .dout           (data_dout      ),
            .full           (data_wrfull    ),
            .empty          (data_rdempty   ),
            .rd_data_count  (data_rdcount   ),
            .wr_data_count  (data_wrcount   ) 
		);
	end
endgenerate

/************* 调试信号 ****************************************************/
always @(posedge clk) begin
    if (~rst_n_sync) 
        wr_data_fifo_err <= 0;
    else if (data_wrfull && data_wren) 
        wr_data_fifo_err <= 1;
    else 
        wr_data_fifo_err <= wr_data_fifo_err;
end

always @(posedge clk) begin
    if (~rst_n_sync) 
        wr_cmd_fifo_err <= 0;
    else if (cmd_wrfull && cmd_wren) 
        wr_cmd_fifo_err <= 1;
    else 
        wr_cmd_fifo_err <= wr_cmd_fifo_err;
end

endmodule

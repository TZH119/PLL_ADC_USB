`timescale 1ns / 1ps

module read_buffer #(
	parameter	AXI_DATA_WIDTH      = 128,
	parameter   AXI_ADDR_WIDTH      = 32 ,
	parameter   USER_RD_DATA_WIDTH	= 16
)(
	/************* 全局控制信号 ****************************************************/
	input                               clk               , //用户端读时钟
	input                               axi_clk           , //axi的时钟
	input                               rst_n             ,

	/************* read_ctrl 交互 ****************************************************/
    input                               rd_req_en         ,
    input       [7:0]                   rd_burst_length   ,
    input       [AXI_ADDR_WIDTH-1:0]    rd_data_addr      ,
    output                              rd_req_ready      ,  //用来指示rd_buffer模块里面的cmd_fifo是否爆满	

	/************* axi_rd_master 交互 ****************************************************/
    output reg                          axi_ar_req_en     ,
    input                               axi_ar_ready      , //axi_ar_req_en 和axi_ar_ready同时为高，开启一次AXI4读传输
    output reg [7:0]                    axi_ar_burst_len  ,
    output reg [AXI_ADDR_WIDTH-1:0]     axi_ar_addr       ,

    input                               axi_r_valid       ,
    input      [AXI_DATA_WIDTH-1:0]     axi_r_data        ,
    input                               axi_r_last        ,

    /************* 用户控制信号 ****************************************************/
	output reg						    user_rd_valid     ,
	output reg                          user_rd_last      ,
	output reg [USER_RD_DATA_WIDTH-1:0] user_rd_data      ,

    /************* 调试信号 ****************************************************/
    output reg                          rd_cmd_fifo_err    ,
    output reg                          rd_data_fifo_err  
);

localparam RD_CNT_MAX = AXI_DATA_WIDTH / USER_RD_DATA_WIDTH - 1;

/************* CDC 信号定义 ****************************************************/
reg             rst_n_sync_d0       ;    //用户端复位信号
reg             rst_n_sync_d1       ;
reg             rst_n_sync          ;
reg             a_rst_n_sync_d0     ; // axi4端的复位信号
reg             a_rst_n_sync_d1     ;
reg             a_rst_n_sync        ;

/************* FIFO 信号定义 ****************************************************/
//CMD
reg	    	    cmd_wren            ;
wire    [39:0]  cmd_dout            ;
wire    	    cmd_rden            ;
wire    	    cmd_wrfull          ;
wire    	    cmd_rdempty         ;
wire    [4:0]   cmd_wrcount         ;
wire    [4:0]   cmd_rdcount         ;
reg	    [39:0]  cmd_din             ;
//数据
reg				data_wren           ;
reg				data_rden           ;
wire			data_wrfull         ;
wire			data_rdempty        ;

/************* 状态机 ****************************************************/
reg     [2:0]   cur_status          ;
reg     [2:0]   nxt_status          ;

localparam  RD_IDLE     =   3'b000  ;
localparam  RD_REQ      =   3'b001  ;
localparam  RD_DATA_EN  =   3'b010  ;
localparam  RD_DATA_END =   3'b100  ;

/************* 信号定义 ****************************************************/
wire							rd_data_buf_ready;
reg								rd_data_flag;
reg	[$clog2(RD_CNT_MAX)-1:0]	rd_cnt;
reg [AXI_DATA_WIDTH-1:0]        rd_data_fifo_out;
reg                             rd_data_fifo_last;

assign rd_req_ready = ~rst_n_sync ? 0 : cmd_wrcount < 'd12; //留一点余量
assign cmd_rden     = axi_ar_req_en & axi_ar_ready;

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
    if (rd_req_en && rd_req_ready) begin
    	cmd_wren <= 1'b1;
    	cmd_din  <= {rd_burst_length,rd_data_addr};
    end
    else begin
    	cmd_wren <= 0;
    	cmd_din  <= cmd_din;    	
    end   
end

/************* 状态机 ****************************************************/
always @(posedge axi_clk) begin
    if (~a_rst_n_sync) 
        cur_status <= RD_IDLE;
    else 
        cur_status <= nxt_status;
end

always @(*) begin
    if (~a_rst_n_sync) 
        nxt_status <= RD_IDLE;
    else begin
        case(cur_status)
            RD_IDLE : begin
                if (~cmd_rdempty && rd_data_buf_ready)
                    nxt_status <= RD_REQ;
                else 
                    nxt_status <= cur_status;
            end
            RD_REQ : begin
                if (axi_ar_req_en && axi_ar_ready)
                    nxt_status <= RD_DATA_EN;
                else 
                    nxt_status <= cur_status;
            end
            RD_DATA_EN : begin
                if (axi_r_valid && axi_r_last)
                    nxt_status <= RD_DATA_END;
                else 
                    nxt_status <= cur_status;
            end
            RD_DATA_END : begin
                nxt_status <= RD_IDLE;
            end
            default : nxt_status <= RD_IDLE;
        endcase
    end
end

/************* 读请求信号 ****************************************************/
always @(posedge axi_clk) begin
    if (~a_rst_n_sync) 
        axi_ar_req_en <= 0;
    else if (axi_ar_req_en && axi_ar_ready) 
        axi_ar_req_en <= 0;
    else if (cur_status == RD_REQ)
        axi_ar_req_en <= 1;
    else 
        axi_ar_req_en <= axi_ar_req_en;    
end

always @(*) begin
    if (~a_rst_n_sync) begin
        axi_ar_burst_len <= 0;
        axi_ar_addr      <= 0;
    end
    else begin
        axi_ar_burst_len <= cmd_dout[39:32];
        axi_ar_addr      <= cmd_dout[31:0];
    end 
end

/************* CMD FIFO ****************************************************/
fifo_w40xd16 rd_cmd_fifo (
  .rst(~rst_n_sync),                      // input wire rst
  .wr_clk(clk),                // input wire wr_clk
  .rd_clk(axi_clk),                // input wire rd_clk
  .din(cmd_din),                      // input wire [39 : 0] din
  .wr_en(cmd_wren),                  // input wire wr_en
  .rd_en(cmd_rden),                  // input wire rd_en
  .dout(cmd_dout),                    // output wire [39 : 0] dout
  .full(cmd_wrfull),                    // output wire full
  .empty(cmd_rdempty),                  // output wire empty
  .rd_data_count(cmd_rdcount),  // output wire [4 : 0] rd_data_count
  .wr_data_count(cmd_wrcount)  // output wire [4 : 0] wr_data_count
);

generate
	if (AXI_DATA_WIDTH == 256) begin
		
		reg  [287:0] data_din;
		wire [287:0] data_dout;
		wire [9:0]   data_wrcount;
		wire [9:0]   data_rdcount;

		always @(posedge axi_clk) begin
			data_wren <= axi_r_valid;
			data_din  <= {31'h0,axi_r_last,axi_r_data};
		end
		
		always @(posedge clk) begin
            if (data_rden) 
                rd_data_fifo_out <= data_dout[255:0];
            else if (rd_data_flag) 
                rd_data_fifo_out <= rd_data_fifo_out >> USER_RD_DATA_WIDTH;
            else 
                rd_data_fifo_out <= rd_data_fifo_out;
        end
        
        always @(posedge clk) begin
            if (rd_data_flag && rd_cnt == RD_CNT_MAX) 
                rd_data_fifo_last <= 0;
            else if (data_rden && data_dout[256]) 
                rd_data_fifo_last <= 1'b1;
            else 
                rd_data_fifo_last <= rd_data_fifo_last;
        end
		
		assign rd_data_buf_ready = ~a_rst_n_sync ? 0 :data_wrcount <= 'd384;

		fifo_w288xd512 rd_data_fifo (
            .rst              (~a_rst_n_sync  ),
            .wr_clk           (axi_clk        ),
            .rd_clk           (clk            ),
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

		reg  [144:0] data_din;
		wire [144:0] data_dout;
		wire [9:0]   data_wrcount;
		wire [9:0]   data_rdcount;

		always @(posedge axi_clk) begin
			data_wren <= axi_r_valid;
			data_din  <= {15'h0,axi_r_last,axi_r_data};
		end
		
		always @(posedge clk) begin
		    if (data_rden) 
		        rd_data_fifo_out <= data_dout[127:0];
		    else if (rd_data_flag) 
		        rd_data_fifo_out <= rd_data_fifo_out >> USER_RD_DATA_WIDTH;
		    else 
		        rd_data_fifo_out <= rd_data_fifo_out;
		end
		
		always @(posedge clk) begin
		    if (rd_data_flag && rd_cnt == RD_CNT_MAX) 
		        rd_data_fifo_last <= 0;
		    else if (data_rden && data_dout[128]) 
		        rd_data_fifo_last <= 1'b1;
		    else 
		        rd_data_fifo_last <= rd_data_fifo_last;
		end
		
		assign rd_data_buf_ready = ~a_rst_n_sync ? 0 :data_wrcount <= 'd256;

		fifo_w144xd512 rd_data_fifo (
            .rst              (~a_rst_n_sync  ),
            .wr_clk           (axi_clk        ),
            .rd_clk           (clk            ),
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

		reg  [71:0]  data_din;
		wire [71:0]  data_dout;
		wire [9:0]   data_wrcount;
		wire [9:0]   data_rdcount;

		always @(posedge axi_clk) begin
			data_wren <= axi_r_valid;
			data_din  <= {7'h0,axi_r_last,axi_r_data};
		end
		
		always @(posedge clk) begin
            if (data_rden) 
                rd_data_fifo_out <= data_dout[63:0];
            else if (rd_data_flag) 
                rd_data_fifo_out <= rd_data_fifo_out >> USER_RD_DATA_WIDTH;
            else 
                rd_data_fifo_out <= rd_data_fifo_out;
		end
		
		always @(posedge clk) begin
            if (rd_data_flag && rd_cnt == RD_CNT_MAX) 
                rd_data_fifo_last <= 0;
            else if (data_rden && data_dout[64]) 
                rd_data_fifo_last <= 1'b1;
            else 
                rd_data_fifo_last <= rd_data_fifo_last;
        end
		
		assign rd_data_buf_ready = ~a_rst_n_sync ? 0 :data_wrcount <= 'd256;

		fifo_w72xd512 rd_data_fifo (
            .rst              (~a_rst_n_sync  ),
            .wr_clk           (axi_clk        ),
            .rd_clk           (clk            ),
            .din              (data_din       ),
            .wr_en            (data_wren      ),
            .rd_en            (data_rden      ),
            .dout             (data_dout      ),
            .full             (data_wrfull    ),
            .empty            (data_rdempty   ),
            .rd_data_count    (data_rdcount   ),
            .wr_data_count    (data_wrcount   )
		);	
	end
endgenerate

/*--------------------------------------------------*\
		    将数据从data_fifo里面读出来给用户
\*--------------------------------------------------*/
always @(posedge clk) begin
    if (~rst_n_sync) 
        data_rden <= 0;
    else if (data_rden) 
        data_rden <= 0;
    else if (~data_rdempty && ~rd_data_flag)
        data_rden <= 1'b1;
    else 
        data_rden <= data_rden;
end

always @(posedge clk) begin
    if (~rst_n_sync) 
        rd_data_flag <= 0;
    else if (rd_cnt == RD_CNT_MAX && rd_data_flag) 
        rd_data_flag <= 0;
    else if (data_rden)
		rd_data_flag <= 1'b1;
    else 
        rd_data_flag <= rd_data_flag;
        
end


always @(posedge clk) begin
    if (~rst_n_sync) 
        rd_cnt <= 0;
    else if (rd_cnt == RD_CNT_MAX && rd_data_flag) 
        rd_cnt <= 0;
    else if (rd_data_flag)
        rd_cnt <= rd_cnt + 1;
    else 
        rd_cnt <= rd_cnt;    
end

always @(posedge clk) begin
    if (~rst_n_sync) begin
        user_rd_data  <= 0;
        user_rd_valid <= 0;
    end
    else if (rd_data_flag) begin
        user_rd_data  <= rd_data_fifo_out[USER_RD_DATA_WIDTH-1:0];
		user_rd_valid <= 1'b1;
    end    
    else begin
        user_rd_data  <= 0;
		user_rd_valid <= 0;
    end   
end

always @(posedge clk) begin
    if (~rst_n_sync) 
        user_rd_last <= 0;
    else if (rd_cnt == RD_CNT_MAX && rd_data_fifo_last) 
        user_rd_last <= 1;
    else 
        user_rd_last <= 0;
end

/************* 调试信号 ****************************************************/
always @(posedge axi_clk) begin
    if (~a_rst_n_sync) 
        rd_data_fifo_err <= 0;
    else if (data_wrfull && data_wren) 
        rd_data_fifo_err <= 1;
    else 
        rd_data_fifo_err <= rd_data_fifo_err;
end

always @(posedge clk) begin
    if (~rst_n_sync) 
        rd_cmd_fifo_err <= 0;
    else if (cmd_wrfull && cmd_wren) 
        rd_cmd_fifo_err <= 1;
    else 
        rd_cmd_fifo_err <= rd_cmd_fifo_err;
end

endmodule

// -----------------------------------------------------------------------------
// Author : XiaoBai FPGA 
// File   : axi_wr_master.v
// Create : 2023-12-29 12:56:03
// -----------------------------------------------------------------------------
`timescale 1ns / 1ps

module axi_wr_master #(
	parameter       AXI_DATA_WIDTH     = 128 ,
	parameter       AXI_ADDR_WIDTH     = 32  	
)(
	
	input                             axi_clk           ,
	input                             reset             ,

	/*-------------wr_buffer模块交互信号-------------*/
	input                             axi_aw_req_en     , //表示AXI4写请求
	output reg                        axi_aw_ready      , //axi_aw_req_en 和axi_aw_ready同时为高，开启一次AXI4写传输
	input      [7:0]                  axi_aw_burst_len  ,
	input      [AXI_ADDR_WIDTH-1:0]   axi_aw_addr       ,

	input                             axi_w_valid       ,
	output reg                        axi_w_ready       ,
	input      [AXI_DATA_WIDTH-1:0]   axi_w_data        ,
	input                             axi_w_last        ,

	/*-------------AXI写通道端口信号---------------------*/
	output reg                        m_axi_awvalid     ,
	input                             m_axi_awready     ,
	output reg [AXI_ADDR_WIDTH-1:0]   m_axi_awaddr      ,
	output reg [3:0]                  m_axi_awid        ,
	output reg [7:0]                  m_axi_awlen       ,
	output reg [1:0]                  m_axi_awburst     ,
	output reg [2:0]                  m_axi_awsize      ,
	output reg [2:0]                  m_axi_awprot      ,
	output reg [3:0]                  m_axi_awqos       ,
	output reg                        m_axi_awlock      ,
	output reg [3:0]                  m_axi_awcache     ,

	output reg                        m_axi_wvalid      ,
	input                             m_axi_wready      ,
	output reg [AXI_DATA_WIDTH-1:0]   m_axi_wdata       ,
	output reg [AXI_DATA_WIDTH/8-1:0] m_axi_wstrb       ,   	
	output reg                        m_axi_wlast       , 

	input      [3:0]                  m_axi_bid         ,
	input      [1:0]                  m_axi_bresp       ,
	input                             m_axi_bvalid      ,
	output                            m_axi_bready      
	);

(* dont_touch ="true" *)reg a_reset_sync_d0; // axi4端的复位信号
(* dont_touch ="true" *)reg a_reset_sync_d1;
(* dont_touch ="true" *)reg a_reset_sync;
/*------------------------------------------*\
                状态机定义
\*------------------------------------------*/
reg [2:0] cur_status;
reg [2:0] nxt_status;

localparam AXI_WR_IDLE = 3'b000;
localparam AXI_WR_PRE  = 3'b001;
localparam AXI_WR_DATA = 3'b010;
localparam AXI_WR_END  = 3'b100; 

assign m_axi_bready = 1'b1;
/*--------------------------------------------------*\
				     CDC process
\*--------------------------------------------------*/

always @(posedge axi_clk) begin
	a_reset_sync_d0 <= reset;
	a_reset_sync_d1 <= a_reset_sync_d0;
	a_reset_sync    <= a_reset_sync_d1;    
end

always @(posedge axi_clk) begin
    m_axi_awprot  <=	0;
	m_axi_awid    <=	0;
	m_axi_awburst <=	2'b01;
	m_axi_awlock  <=	0;
	m_axi_awcache <=	0;
	m_axi_awqos   <=	0;
	m_axi_wstrb   <=	{AXI_DATA_WIDTH/8{1'b1}};
	m_axi_awsize  <=	AXI_DATA_WIDTH == 512 ? 3'h6 :
						AXI_DATA_WIDTH == 256 ? 3'h5 :
						AXI_DATA_WIDTH == 128 ? 3'h4 :
						AXI_DATA_WIDTH == 64  ? 3'h3 :
						AXI_DATA_WIDTH == 32  ? 3'h2 : 3'h0;
end

/*--------------------------------------------------*\
				     状态机代码
\*--------------------------------------------------*/

always @(posedge axi_clk) begin
    if (a_reset_sync) 
        cur_status <= AXI_WR_IDLE;
    else 
        cur_status <= nxt_status;
end

always @(*) begin
    if (a_reset_sync) 
        nxt_status <= AXI_WR_IDLE;
    else begin
		case(cur_status)
			AXI_WR_IDLE : begin
				if (axi_aw_req_en) 
					nxt_status <= AXI_WR_PRE;
				else 
					nxt_status <= cur_status;
			end
			AXI_WR_PRE : begin
				nxt_status <= AXI_WR_DATA;
			end
			AXI_WR_DATA : begin
				if (m_axi_wvalid && m_axi_wready && m_axi_wlast)
					nxt_status <= AXI_WR_END;
				else 
					nxt_status <= cur_status;
			end
			AXI_WR_END : begin
				nxt_status <= AXI_WR_IDLE;
			end
			default : nxt_status <= AXI_WR_IDLE;
		endcase
	end
end

/*------------------------------------------*\
           输出给wr_buffer模块ready信号
\*------------------------------------------*/
always @(*) begin
	axi_aw_ready <= cur_status == AXI_WR_PRE;
	axi_w_ready  <= m_axi_wready;
end

/*------------------------------------------*\
               AXI4写通道的信号
\*------------------------------------------*/

always @(posedge axi_clk) begin
    if (a_reset_sync) 
        m_axi_awvalid <= 0;
    else if (m_axi_awvalid && m_axi_awready) 
        m_axi_awvalid <= 0;
    else if (axi_aw_req_en && axi_aw_ready)
        m_axi_awvalid <= 1;
end

always @(posedge axi_clk) begin
	if (axi_aw_req_en && axi_aw_ready) begin
		m_axi_awaddr <= axi_aw_addr;
		m_axi_awlen  <= axi_aw_burst_len;
	end
	else begin
		m_axi_awaddr <= m_axi_awaddr;
		m_axi_awlen  <= m_axi_awlen;		
	end
end

always @(posedge axi_clk) begin
    if (a_reset_sync) 
        m_axi_wvalid <= 0;
    else if (m_axi_wvalid && m_axi_wready && m_axi_wlast) 
        m_axi_wvalid <= 0;
    else if (axi_w_valid && axi_w_ready)
        m_axi_wvalid <= 1;
    else 
		m_axi_wvalid <= m_axi_wvalid;
end

always @(posedge axi_clk) begin
    if (a_reset_sync) 
        m_axi_wlast <= 0;
    else if (m_axi_wvalid && m_axi_wready && m_axi_wlast)
        m_axi_wlast <= 0;        
    else if (axi_w_valid && axi_w_ready && axi_w_last) 
        m_axi_wlast <= 1;
end

always @(posedge axi_clk) begin
    if (axi_w_valid && axi_w_ready) 
        m_axi_wdata <= axi_w_data;
    else 
        m_axi_wdata <= m_axi_wdata;
end



endmodule

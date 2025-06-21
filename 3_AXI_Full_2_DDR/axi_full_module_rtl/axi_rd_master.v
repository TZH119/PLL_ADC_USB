// -----------------------------------------------------------------------------
// Author : XiaoBai FPGA 
// File   : axi_rd_master.v
// Create : 2023-12-30 16:16:18
// -----------------------------------------------------------------------------
`timescale 1ns / 1ps
module axi_rd_master #(
	parameter       AXI_DATA_WIDTH     = 128 ,
	parameter       AXI_ADDR_WIDTH     = 32  

)(
	input                               axi_clk           ,
	input                               reset             ,

    /*-------------rd_buffer模块交互信号----------------*/		
	input                               axi_ar_req_en     ,
	output                              axi_ar_ready      , //axi_ar_req_en 和axi_ar_ready同时为高，开启一次AXI4读传输
	input      [7:0]                    axi_ar_burst_len  ,
	input      [AXI_ADDR_WIDTH-1:0]     axi_ar_addr       ,

	output reg                          axi_r_valid       ,
	output reg [AXI_DATA_WIDTH-1:0]     axi_r_data        ,
	output reg                          axi_r_last        ,  

	/*-------------AXI读通道端口信号---------------------*/
	output reg                        	m_axi_arvalid     ,
	input                             	m_axi_arready     ,
	output reg [AXI_ADDR_WIDTH-1:0]   	m_axi_araddr      ,
	output reg [3:0]                  	m_axi_arid        ,
	output reg [7:0]                  	m_axi_arlen       ,
	output reg [1:0]                  	m_axi_arburst     ,
	output reg [2:0]                  	m_axi_arsize      ,
	output reg [2:0]                  	m_axi_arprot      ,
	output reg [3:0]                  	m_axi_arqos       ,
	output reg                        	m_axi_arlock      ,
	output reg [3:0]                  	m_axi_arcache     ,

	input      [3:0]                  	m_axi_rid         ,
	input                             	m_axi_rvalid      ,
	output                            	m_axi_rready      ,
	input      [AXI_DATA_WIDTH-1:0]   	m_axi_rdata       ,
	input                             	m_axi_rlast       ,
	input      [1:0]                  	m_axi_rresp       
);

(* dont_touch ="true" *)reg a_reset_sync_d0; // axi4端的复位信号
(* dont_touch ="true" *)reg a_reset_sync_d1;
(* dont_touch ="true" *)reg a_reset_sync;

/*------------------------------------------*\
                状态机定义
\*------------------------------------------*/
reg [2:0]  cur_status;
reg [2:0]  nxt_status;
localparam AXI_RD_IDLE = 3'b000;
localparam AXI_RD_PRE  = 3'b001;
localparam AXI_RD_DATA = 3'b010;
localparam AXI_RD_END  = 3'b100; 

/*--------------------------------------------------*\
				     assign 
\*--------------------------------------------------*/
assign m_axi_rready = 1'b1;
assign axi_ar_ready = cur_status == AXI_RD_PRE;
/*--------------------------------------------------*\
				     CDC process
\*--------------------------------------------------*/
always @(posedge axi_clk) begin
	a_reset_sync_d0 <= reset;
	a_reset_sync_d1 <= a_reset_sync_d0;
	a_reset_sync    <= a_reset_sync_d1;    
end

always @(posedge axi_clk) begin
    m_axi_arprot  <= 0;
	m_axi_arid    <= 0;
	m_axi_arburst <= 2'b01;
	m_axi_arlock  <= 0;
	m_axi_arcache <= 0;
	m_axi_arqos   <= 0;
	m_axi_arsize  <= AXI_DATA_WIDTH == 512 ? 3'h6 :
					 AXI_DATA_WIDTH == 256 ? 3'h5 :
					 AXI_DATA_WIDTH == 128 ? 3'h4 :
					 AXI_DATA_WIDTH == 64  ? 3'h3 :
					 AXI_DATA_WIDTH == 32  ? 3'h2 : 3'h0;
end

/*--------------------------------------------------*\
				      状态机
\*--------------------------------------------------*/
always @(posedge axi_clk) begin
    if (a_reset_sync) 
        cur_status <= AXI_RD_IDLE;
    else 
        cur_status <= nxt_status;
end

always @(*) begin
    if (a_reset_sync) 
        nxt_status <= AXI_RD_IDLE;
    else begin
    	case(cur_status)
    		AXI_RD_IDLE : begin
    			if (axi_ar_req_en)
    				nxt_status <= AXI_RD_PRE;
    			else 
    				nxt_status <= cur_status;
    		end
    		AXI_RD_PRE : begin
    			nxt_status <= AXI_RD_DATA;
    		end
    		AXI_RD_DATA : begin
    			if (m_axi_rvalid && m_axi_rlast && m_axi_rready)
    				nxt_status <= AXI_RD_END;
    			else 
    				nxt_status <= cur_status;
    		end
    		AXI_RD_END : begin
    			nxt_status <= AXI_RD_IDLE;
    		end
    		default : nxt_status <= AXI_RD_IDLE;
    	endcase
    end
end

/*--------------------------------------------------*\
				     AXI4读通道信号
\*--------------------------------------------------*/

always @(posedge axi_clk) begin
    if (a_reset_sync) 
		m_axi_arvalid <= 0; 
    else if (m_axi_arvalid && m_axi_arready) 
        m_axi_arvalid <= 0;
    else if (axi_ar_req_en && axi_ar_ready)
        m_axi_arvalid <= 1'b1;
    else 
    	m_axi_arvalid <= m_axi_arvalid;
end

always @(posedge axi_clk) begin
    if (a_reset_sync) begin 
        m_axi_araddr <= 0;
        m_axi_arlen  <= 0;     
    end
    else if (axi_ar_req_en && axi_ar_ready) begin
    	m_axi_araddr <= axi_ar_addr;
    	m_axi_arlen  <= axi_ar_burst_len;
    end 
    else begin
    	m_axi_araddr <= m_axi_araddr;
    	m_axi_arlen  <= m_axi_arlen;    	
    end 
end

always @(posedge axi_clk) begin
	axi_r_valid <= m_axi_rvalid;
	axi_r_data  <= m_axi_rdata;
	axi_r_last 	<= m_axi_rlast;	  
end

endmodule

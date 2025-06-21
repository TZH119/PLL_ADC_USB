`timescale 1ns / 1ps

module axi_write_channel#(
	parameter	AXI_DATA_WIDTH		=	128	,
	parameter	AXI_ADDR_WIDTH		=	32	,
	parameter	USER_WR_DATA_WIDTH	=	16
)(
	/************* 全局控制信号 ****************************************************/
	input	wire								user_wr_clk			,//用户端写时钟
	input	wire								axi_clk				,//AXI4端时钟
	input	wire								rst_n				,//全局复位
	/*使能信号，用于模块启动 & DDR初始化完成 ...*/	
	input	wire 								wr_channel_en		,

	/************* 用户控制信号 ****************************************************/
	input 	wire								user_wr_en			,
	input 	wire								user_wr_last		,
	input 	wire	[USER_WR_DATA_WIDTH-1:0]	user_wr_data		,
	input 	wire	[AXI_ADDR_WIDTH-1:0]		user_wr_addr		,
	input 	wire	[12:0]						user_wr_length		,

	/************* AXI4-FULL写 ****************************************************/
	output	wire								m_axi_awvalid		,
	input	wire								m_axi_awready		,
	output	wire	[AXI_ADDR_WIDTH-1:0]		m_axi_awaddr		,
	output	wire	[3:0]						m_axi_awid			,
	output	wire	[7:0]						m_axi_awlen			,
	output	wire	[1:0]						m_axi_awburst		,
	output	wire	[2:0]						m_axi_awsize		,
	output	wire	[2:0]						m_axi_awprot		,
	output	wire	[3:0]						m_axi_awqos			,
	output	wire								m_axi_awlock		,
	output	wire	[3:0]						m_axi_awcache		,

	output	wire								m_axi_wvalid		,
	input	wire								m_axi_wready		,
	output	wire	[AXI_DATA_WIDTH-1:0]		m_axi_wdata			,
	output	wire	[AXI_DATA_WIDTH/8-1:0]		m_axi_wstrb			,
	output	wire								m_axi_wlast			,

	input	wire	[3:0]						m_axi_bid			,
	input	wire	[1:0]						m_axi_bresp 		,
	input	wire								m_axi_bvalid		,
	output	wire								m_axi_bready		,

	/************* 调试信号 ****************************************************/
	output	wire								wr_cmd_fifo_err		,
	output	wire								wr_data_fifo_err
);

/************* 信号定义 ****************************************************/
//write_ctrl & write_buffer 交互
wire	                    	wr_req_en      	;
wire	[7:0]               	wr_burst_length	;
wire	[AXI_ADDR_WIDTH-1:0]	wr_data_addr   	;
wire	                    	wr_data_valid  	;
wire	[AXI_DATA_WIDTH-1:0]	wr_data_out		;
wire	                    	wr_data_last   	; 
//write_buffer & axi_wr_master 交互
wire	                    	axi_aw_req_en   ;//表示AXI4写请求
wire	                    	axi_aw_ready    ;//axi_aw_req_en 和axi_aw_ready同时为高，开启一次AXI4写传输
wire	[7:0]               	axi_aw_burst_len;
wire	[AXI_ADDR_WIDTH-1:0]	axi_aw_addr     ;
wire							axi_w_valid     ;
wire                        	axi_w_ready     ;
wire	[AXI_DATA_WIDTH-1:0]	axi_w_data		;
wire                        	axi_w_last      ;

write_ctrl #(
	.USER_WR_DATA_WIDTH		(USER_WR_DATA_WIDTH	),
	.AXI_DATA_WIDTH			(AXI_DATA_WIDTH		),
	.AXI_ADDR_WIDTH			(AXI_ADDR_WIDTH		)
)write_ctrl(
	/************* 全局控制信号 ****************************************************/
	.clk					(user_wr_clk		),//用户端写时钟
	.rst_n					(rst_n				),//全局复位
	/*使能信号，用于模块启动 & DDR初始化完成 ...*/	
	.wr_channel_en			(wr_channel_en		),

	/************* 用户控制信号 ****************************************************/
	.user_wr_en				(user_wr_en			),
	.user_wr_last			(user_wr_last		),
	.user_wr_data			(user_wr_data		),
	.user_wr_addr			(user_wr_addr		),
	.user_wr_length			(user_wr_length		),

	/************* write_buffer 交互 ****************************************************/
	.wr_req_en				(wr_req_en			),
	.wr_burst_length		(wr_burst_length	),
	.wr_data_addr			(wr_data_addr		),
	.wr_data_valid			(wr_data_valid		),
	.wr_data_out			(wr_data_out		),
	.wr_data_last			(wr_data_last		)
);

write_buffer#(
	.AXI_DATA_WIDTH			(AXI_DATA_WIDTH		),
	.AXI_ADDR_WIDTH			(AXI_ADDR_WIDTH		)
)write_buffer(
	/************* 全局控制信号 ****************************************************/
	.clk              		(user_wr_clk		),
	.axi_clk          		(axi_clk			),
	.rst_n            		(rst_n				),

	/************* write_ctrl 交互 ****************************************************/
	.wr_req_en        		(wr_req_en			),
	.wr_burst_length  		(wr_burst_length	),
	.wr_data_addr     		(wr_data_addr		),
	.wr_data_valid    		(wr_data_valid		),
	.wr_data_in       		(wr_data_out		),
	.wr_data_last     		(wr_data_last		),

	/************* axi_wr_master 交互 ****************************************************/
	.axi_aw_req_en    		(axi_aw_req_en		),
	.axi_aw_ready     		(axi_aw_ready		),
	.axi_aw_burst_len 		(axi_aw_burst_len	),
	.axi_aw_addr      		(axi_aw_addr		),			
	.axi_w_valid      		(axi_w_valid		),
	.axi_w_ready      		(axi_w_ready		),
	.axi_w_data       		(axi_w_data			),
	.axi_w_last       		(axi_w_last			),

	/************* 调试信号 ****************************************************/
	.wr_cmd_fifo_err  		(wr_cmd_fifo_err	),
	.wr_data_fifo_err 		(wr_data_fifo_err	)
);

axi_wr_master #(
	.AXI_DATA_WIDTH(AXI_DATA_WIDTH),
	.AXI_ADDR_WIDTH(AXI_ADDR_WIDTH)
) axi_wr_master (
	.axi_clk          		(axi_clk			),
	.reset            		(~rst_n				),

	.axi_aw_req_en    		(axi_aw_req_en		),
	.axi_aw_ready     		(axi_aw_ready		),
	.axi_aw_burst_len 		(axi_aw_burst_len	),
	.axi_aw_addr      		(axi_aw_addr		),
	.axi_w_valid      		(axi_w_valid		),
	.axi_w_ready      		(axi_w_ready		),
	.axi_w_data       		(axi_w_data			),
	.axi_w_last       		(axi_w_last			),

	.m_axi_awvalid    		(m_axi_awvalid		),
	.m_axi_awready    		(m_axi_awready		),
	.m_axi_awaddr     		(m_axi_awaddr		),
	.m_axi_awid       		(m_axi_awid			),
	.m_axi_awlen      		(m_axi_awlen		),
	.m_axi_awburst    		(m_axi_awburst		),
	.m_axi_awsize     		(m_axi_awsize		),
	.m_axi_awprot     		(m_axi_awprot		),
	.m_axi_awqos      		(m_axi_awqos		),
	.m_axi_awlock     		(m_axi_awlock		),
	.m_axi_awcache    		(m_axi_awcache		),

	.m_axi_wvalid     		(m_axi_wvalid		),
	.m_axi_wready     		(m_axi_wready		),
	.m_axi_wdata      		(m_axi_wdata		),
	.m_axi_wstrb      		(m_axi_wstrb		),
	.m_axi_wlast      		(m_axi_wlast		),

	.m_axi_bid        		(m_axi_bid			),
	.m_axi_bresp      		(m_axi_bresp		),
	.m_axi_bvalid     		(m_axi_bvalid		),
	.m_axi_bready     		(m_axi_bready		)
);
endmodule

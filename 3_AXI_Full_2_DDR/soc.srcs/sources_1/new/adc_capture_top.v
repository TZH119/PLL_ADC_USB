`timescale 1ns / 1ps

module adc_capture_top(
    /*FPGA_Sys_100MHz*/
    input   wire            Sys_clk_P           ,
    input   wire            Sys_clk_N           ,

    /*ADC1*/            
    input   wire            ADC1_CLK_N          ,
    input   wire            ADC1_CLK_P          ,
    input   wire    [6:0]   ADC1_DATA_P         ,
    input   wire    [6:0]   ADC1_DATA_N         ,
    input   wire            ADC1_OVR            ,             //超范围指示器
    output  wire            ADC1_ADS5547_reset  ,   //AD复位,并行需要把复位绑定到高点平
    //output reg DFS,     //数据格式与LVDS/CMOS输出接口
    output  wire            ADC1_SEN            ,             //串并行模式选择，串行、并行、串并行。//串行并行的区别，串行先清除寄存器，然后通过SDATA读取寄存器数据；并行直接通过外界引脚获取数据。
    output  wire            ADC1_SDATA          ,           //待机模式-全局(ADC、内部基准电压源和输出缓冲器关断）
    output  wire            ADC1_SCLK           ,            //低采样频率(<50MHZ）的低速模式控制

    /*Input Trigger ports*/ 
    input   wire            In_Trig_P           ,
    input   wire            In_Trig_N           ,

    /*system_wrapper*/
    inout   wire    [14:0]  DDR_addr            ,
    inout   wire    [2:0]   DDR_ba              ,
    inout   wire            DDR_cas_n           ,
    inout   wire            DDR_ck_n            ,
    inout   wire            DDR_ck_p            ,
    inout   wire            DDR_cke             ,
    inout   wire            DDR_cs_n            ,
    inout   wire    [3:0]   DDR_dm              ,
    inout   wire    [31:0]  DDR_dq              ,
    inout   wire    [3:0]   DDR_dqs_n           ,
    inout   wire    [3:0]   DDR_dqs_p           ,
    inout   wire            DDR_odt             ,
    inout   wire            DDR_ras_n           ,
    inout   wire            DDR_reset_n         ,
    inout   wire            DDR_we_n            ,
    inout   wire            FIXED_IO_ddr_vrn    ,
    inout   wire            FIXED_IO_ddr_vrp    ,
    inout   wire    [53:0]  FIXED_IO_mio        ,
    inout   wire            FIXED_IO_ps_clk     ,
    inout   wire            FIXED_IO_ps_porb    ,
    inout   wire            FIXED_IO_ps_srstb   ,
    inout   wire    [3:0]   ps_emio_tri_io
);

wire            Sys_clk         ;
wire            In_Trig         ;
wire            clk_200M        ;
wire            clk_10M         ;
wire            adc_clk_ch_1    ;
wire    [13:0]  adc_data_ch_1   ;

/*系统时钟，差分转单端*/
IBUFDS IBUFDS_Sys_clk(
    .I                  (Sys_clk_P      ),
    .IB                 (Sys_clk_N      ),
    .O                  (Sys_clk        )
);

/*In_Trig输入差分信号*/
IBUFDS IBUFDS_inst (
    .O                  (In_Trig        ),
    .I                  (In_Trig_P      ),
    .IB                 (In_Trig_N      ) 
);

/*把100M系统时钟倍频至200M，给 ILA 和 IDELAYE2 作为参考时钟*/
clk_wiz_0 clk_wiz_0_inst(
    .clk_out1           (clk_200M       ),
    .clk_out2           (clk_10M        ),
    .clk_in1            (Sys_clk        )
);

ila_0 ila_trig (
	.clk                (clk_200M       ),
	.probe0             (In_Trig        ) 
);

//reg [13:0]  data_incr;
//always @(posedge adc_clk_ch_1) begin
//    if(!ADC1_ADS5547_reset)
//        data_incr <= 'd0;
//    else
//        data_incr <= data_incr + 1'd1;
//end

adc_channel_ctrl u_adc_channel_1(
    .clk_200M           (clk_200M           ),
    .ADC_CLK_P          (ADC1_CLK_P         ),
    .ADC_CLK_N          (ADC1_CLK_N         ),
    .ADC_DATA_P         (ADC1_DATA_P        ),
    .ADC_DATA_N         (ADC1_DATA_N        ),

    .ADC_OVR            (ADC1_OVR           ),
    .ADC_ADS5547_reset  (ADC1_ADS5547_reset ),
    .ADC_SEN            (ADC1_SEN           ),
    .ADC_SDATA          (ADC1_SDATA         ),
    .ADC_SCLK           (ADC1_SCLK          ),

    .adc_channel_clk    (adc_clk_ch_1       ),
    .adc_channel_data   (adc_data_ch_1      )
);

system_wrapper u_system_wrapper(
    .DDR_addr           (DDR_addr               ),
    .DDR_ba             (DDR_ba                 ),
    .DDR_cas_n          (DDR_cas_n              ),
    .DDR_ck_n           (DDR_ck_n               ),
    .DDR_ck_p           (DDR_ck_p               ),
    .DDR_cke            (DDR_cke                ),
    .DDR_cs_n           (DDR_cs_n               ),
    .DDR_dm             (DDR_dm                 ),
    .DDR_dq             (DDR_dq                 ),
    .DDR_dqs_n          (DDR_dqs_n              ),
    .DDR_dqs_p          (DDR_dqs_p              ),
    .DDR_odt            (DDR_odt                ),
    .DDR_ras_n          (DDR_ras_n              ),
    .DDR_reset_n        (DDR_reset_n            ),
    .DDR_we_n           (DDR_we_n               ),
    .FIXED_IO_ddr_vrn   (FIXED_IO_ddr_vrn       ),
    .FIXED_IO_ddr_vrp   (FIXED_IO_ddr_vrp       ),
    .FIXED_IO_mio       (FIXED_IO_mio           ),
    .FIXED_IO_ps_clk    (FIXED_IO_ps_clk        ),
    .FIXED_IO_ps_porb   (FIXED_IO_ps_porb       ),
    .FIXED_IO_ps_srstb  (FIXED_IO_ps_srstb      ),
    .adc_clk            (adc_clk_ch_1           ),
    .adc_data_in        ({2'd0,adc_data_ch_1}   ),
    .ps_emio_tri_io     (ps_emio_tri_io         )
);

endmodule

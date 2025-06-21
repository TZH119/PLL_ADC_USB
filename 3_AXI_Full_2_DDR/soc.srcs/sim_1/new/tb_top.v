`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/12/20 17:40:13
// Design Name:
// Module Name: tb_top
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module tb_top(

    );
reg signal_in_0;
reg ps_signal_in;
reg axi_done_flag;
reg sys_clk;
reg rst_n;
initial begin
    sys_clk <= 0;
    rst_n <= 0;
    axi_done_flag <= 0;

    signal_in_0 <= 0;
    ps_signal_in <= 0;
    #100
    rst_n <= 1;

    #35000
    #100
    ps_signal_in <= 1;
    #20
    signal_in_0 <= 1;
    #20
    signal_in_0 <= 0;
    #20
    signal_in_0 <= 1;
    #20
    signal_in_0 <= 0;
    #100
    ps_signal_in <= 0;
    #30
    axi_done_flag <= 1;
    #50
    axi_done_flag <= 0;

    #500

    signal_in_0 <= 0;
    ps_signal_in <= 0;
    #100
    rst_n <= 1;
    #100
    ps_signal_in <= 1;
    signal_in_0 <= 1;
    #20
    signal_in_0 <= 0;
    #20
    signal_in_0 <= 1;
    #20
    signal_in_0 <= 0;
    #100
    ps_signal_in <= 0;
    #30
    axi_done_flag <= 1;
    #50
    axi_done_flag <= 0;

end
always #5 sys_clk <= ~sys_clk;

system_wrapper system_wrapper(
    .sys_clk        (sys_clk),
    // .rst_n          (rst_n),
    .signal_in_0    (signal_in_0),//外部触发
    .ps_signal_in   (ps_signal_in)//ps模拟上位机单击
    // .axi_done_flag  (axi_done_flag)//结束信号
    );

endmodule

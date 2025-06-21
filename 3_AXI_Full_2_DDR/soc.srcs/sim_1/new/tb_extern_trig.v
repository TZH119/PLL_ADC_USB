`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2025/03/13 20:42:26
// Design Name:
// Module Name: tb_extern_signal_in
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


module tb_extern_trig();
reg clk;
reg rst_n;
reg signal_in;
reg ps_signal_in;
reg axi_done_flag;
initial begin
    clk <= 0;
    rst_n <= 0;
    ps_signal_in <= 0;
    signal_in <= 0;
    axi_done_flag <= 0;

    #10
    rst_n <= 1;
    #20
    ps_signal_in <= 1;
    #10
    signal_in <= 1;
    #20
    signal_in <= 0;
    #20
    signal_in <= 1;
    #20
    signal_in <= 0;
    #20
    signal_in <= 1;
    #20
    signal_in <= 0;
    #3000
    ps_signal_in <= 0;
    #100
    axi_done_flag <= 1;

    #200
    axi_done_flag <= 0;
    #20
    ps_signal_in <= 1;
    #10
    signal_in <= 1;
    #20
    signal_in <= 0;
    #20
    signal_in <= 1;
    #20
    signal_in <= 0;
    #20
    signal_in <= 1;
    #20
    signal_in <= 0;
    #3000
    ps_signal_in <= 0;
    #100
    axi_done_flag <= 1;
end

always #5 clk <= ~clk;

extern_trig extern_trig_inst(
    .clk                (clk            ),
    .rst_n              (rst_n          ),
    .signal_in          (signal_in      ),
    .ps_signal_in       (ps_signal_in   ),
    .axi_done_flag      (axi_done_flag  ),

    .signal_out         (),
    .signal_enable      (),
    .fifo_rst           ()
);
endmodule

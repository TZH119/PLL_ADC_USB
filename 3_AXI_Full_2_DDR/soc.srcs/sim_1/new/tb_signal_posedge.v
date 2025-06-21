`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2025/03/13 16:09:13
// Design Name:
// Module Name: tb_signal_posedge
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


module tb_signal_posedge();
reg clk         ;
reg rst_n       ;
reg signal_in   ;
initial begin
    clk <= 0;
    rst_n <= 0;
    signal_in <= 0;
    #10
    rst_n <= 1;
    #10
    signal_in <= 1;
    #150
    signal_in <= 0;
end

always #5 clk <= ~clk;

signal_posedge_detect signal_posedge_detect_inst (
    .clk        (clk      ),
    .rst_n      (rst_n    ),
    .signal_in  (signal_in)
);
endmodule

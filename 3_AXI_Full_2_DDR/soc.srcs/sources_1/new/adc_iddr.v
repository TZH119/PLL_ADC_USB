`timescale 1ns/1ps
module adc_iddr(//input
input sys_clk,
input						CLK_P,
input						CLK_N,

input						rst_n,
input			[6:0]	adc_data_p_in,
input			[6:0]	adc_data_n_in,
//
output reg	[13:0]	adc_data_out
);
wire	[6:0]	adc_data;
wire	[6:0]	adc_demux0_data;
wire	[6:0]	adc_demux1_data;
   
always @(posedge sys_clk or negedge rst_n)
begin
	if(!rst_n)
		adc_data_out <= 14'b0;
	else
		begin
			adc_data_out[0]  <= adc_demux0_data[0];
			adc_data_out[1]  <= adc_demux1_data[0];
			adc_data_out[2]  <= adc_demux0_data[1];
			adc_data_out[3]  <= adc_demux1_data[1];
			adc_data_out[4]  <= adc_demux0_data[2];
			adc_data_out[5]  <= adc_demux1_data[2];
			adc_data_out[6]  <= adc_demux0_data[3];
			adc_data_out[7]  <= adc_demux1_data[3];
			adc_data_out[8]  <= adc_demux0_data[4];
			adc_data_out[9]  <= adc_demux1_data[4];
			adc_data_out[10] <= adc_demux0_data[5];
			adc_data_out[11] <= adc_demux1_data[5];
			adc_data_out[12] <= adc_demux0_data[6];
			adc_data_out[13] <= adc_demux1_data[6];
		end
end

parameter   SIZE = 4'd6;
genvar i;
generate 
begin
	for(i=0;i<=SIZE;i=i+1) 
	begin : ADC_DATA_IN
	
		IBUFDS #(
			.DIFF_TERM("TRUE"), // Differential Termination
			.IBUF_LOW_PWR("FALSE"), // Low power="TRUE", Highest performance="FALSE"
			.IOSTANDARD("DEFAULT") // Specify the input I/O standard
		)i_IBUFDS(
			.O(adc_data[i]), // Buffer output
			.I(adc_data_p_in[i]), // Diff_p buffer input (connect directly to top-level port)
			.IB(adc_data_n_in[i]) // Diff_n buffer input (connect directly to top-level port)
		);
		
        IDDR #(
          .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"), // "OPPOSITE_EDGE", "SAME_EDGE" 
                                          //    or "SAME_EDGE_PIPELINED" 
          .INIT_Q1(1'b0), // Initial value of Q1: 1'b0 or 1'b1
          .INIT_Q2(1'b0), // Initial value of Q2: 1'b0 or 1'b1
          .SRTYPE("ASYNC") // Set/Reset type: "SYNC" or "ASYNC" 
       ) IDDR_inst (
          .Q1(adc_demux0_data[i]), // 1-bit output for positive edge of clock
          .Q2(adc_demux1_data[i]), // 1-bit output for negative edge of clock
          .C(sys_clk),   // 1-bit clock input
          .CE(1), // 1-bit clock enable input
          .D(adc_data[i]),   // 1-bit DDR data input
          .R(0)   // 1-bit reset
       );
	end
end
endgenerate

endmodule

module register #(parameter width = 8) (
	input clk,
	input reset,
	input enable,
	input [width-1:0] in,
	output reg [width-1:0] out
);
	always @(posedge clk, posedge reset) 
		if(reset) out <= 0;
		else if(enable) out <= in;
	
endmodule 
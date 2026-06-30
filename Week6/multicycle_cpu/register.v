module register #(parameter width = 8) (
	input clk,
	input enable,
	input [width-1:0] in,
	output reg [width-1:0] out
);
	always @(posedge clk) if(enable) out <= in;
	
endmodule 
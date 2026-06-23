module flag(
	input clk, we, reset,
	input [3:0] load,
	output reg [3:0] conz
);
	
	always @(posedge clk, posedge reset)
		if(reset) conz <= 0;
		else if(we) conz <= load;
		
endmodule

module dmem(
	input clk, reset, we,
	input [3:0] addr,
	input [7:0] wdata,
	output reg [7:0] rdata,
	output [127:0] out
);
	
	reg [7:0] data [15:0];
	
	always @(posedge clk, posedge reset)
		if(reset) begin
			data[0] <= 8'b00000111;
			data[1] <= 8'b00000011;
			data[2] <= 8'b00000010;
			data[3] <= 8'b00000001; 
			data[4] <= 8'b00000110; 
			data[5] <= 8'b00000100; 
			data[6] <= 8'b00000101;
			data[7] <= 8'b00001000;
			data[8] <= 8'b00000111;
			data[9] <= 0;
			data[10] <= 0;
			data[11] <= 0;
			data[12] <= 0;
			data[13] <= 0;
			data[14] <= 0;
			data[15] <= 0;	
		end
		else if(we) data[addr] <= wdata;
	
	always @(*) rdata <= data[addr];
	
	assign out = {data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[8],data[9],data[10],data[11],data[12],data[13],data[14],data[15]};
	
endmodule 
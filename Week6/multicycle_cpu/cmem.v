module cmem(
	input clk, reset, we,
	input [5:0] raddr, waddr,
	input [15:0] wdata,
	output reg [15:0] rdata
);
	
	reg [15:0] code [63:0];
	
	always @(posedge clk, posedge reset)
		if(reset) begin
			code[0] <= 16'b0011000000000000;
			code[1] <= 16'b1000110000001000;
			code[2] <= 16'b0011010000000000;
			code[3] <= 16'b1101001100000000;
			code[4] <= 16'b1111001100001110;
			code[5] <= 16'b1000110000001000;
			code[6] <= 16'b0110110000000000;
			code[7] <= 16'b1101011100000000;
			code[8] <= 16'b1111001100001000;
			code[9] <= 16'b1001100100000000;
			code[10] <= 16'b1001110100000001;
			code[11] <= 16'b1101111000000000;
			code[12] <= 16'b1111001100000010;
			code[13] <= 16'b1011110100000000;
			code[14] <= 16'b1011100100000001;
			code[15] <= 16'b0101010000000001;
			code[16] <= 16'b1110000011110100;
			code[17] <= 16'b0101000000000001;
			code[18] <= 16'b1110000011101110;
			code[19] <= 0;
			code[20] <= 0;
			code[21] <= 0;
			code[22] <= 0;
			code[23] <= 0;
			code[24] <= 0;
			code[25] <= 0;
			code[26] <= 0;
			code[27] <= 0;
			code[28] <= 0;
			code[29] <= 0;
			code[30] <= 0;
			code[31] <= 0;
			code[32] <= 0;
			code[33] <= 0;
			code[34] <= 0;
			code[35] <= 0;
			code[36] <= 0;
			code[37] <= 0;
			code[38] <= 0;
			code[39] <= 0;
			code[40] <= 0;
			code[41] <= 0;
			code[42] <= 0;
			code[43] <= 0;
			code[44] <= 0;
			code[45] <= 0;
			code[46] <= 0;
			code[47] <= 0;
			code[48] <= 0;
			code[49] <= 0;
			code[50] <= 0;
			code[51] <= 0;
			code[52] <= 0;
			code[53] <= 0;
			code[54] <= 0;
			code[55] <= 0;
			code[56] <= 0;
			code[57] <= 0;
			code[58] <= 0;
			code[59] <= 0;
			code[60] <= 0;
			code[61] <= 0;
			code[62] <= 0;
			code[63] <= 0; 
		end
		else if(we) code[waddr] <= wdata;
		
	always @(*) rdata <= code[raddr]; 
	
endmodule 
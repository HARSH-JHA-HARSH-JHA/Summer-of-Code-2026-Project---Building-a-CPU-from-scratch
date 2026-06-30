// Week 2 — 8-bit ALU
// op: 10=ADD 11=SUB/CMP 00=SHIFTL 01=SHIFTR

module alu(
   input  [7:0]     a, b,
   input  [1:0]     op,
   output reg [7:0] result,
   output reg         zero,
   output reg       carry,
   output reg       overflow,
	output reg			  neg
);

	always @(*)
		case(op)
			2'b10 : begin
				{carry,result} = {1'b0,a} + {1'b0,b};
				overflow = a[7]&b[7]&~result[7]|~a[7]&~b[7]&result[7];
			end
			2'b11 : begin
				{carry,result} = {1'b0,a} + {1'b0,~b} + 1;
				overflow = 0;
			end
			2'b00 : begin
				{carry,result} = {a,1'b0};
				overflow = 0;
			end
			2'b01 : begin
				{result,carry} = {1'b0,a};
				overflow = 0;
			end
		endcase
	always @(*) zero = ~(|result);
	always @(*) neg = result[7];
endmodule

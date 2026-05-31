// Week 2 — 8-bit ALU
// op: 000=ADD 001=SUB 010=AND 011=OR 100=XOR 101=SHIFTL 110=SHIFTR

module alu(
   input  [7:0]     a, b,
   input  [2:0]     op,
   output reg [7:0] result,
   output           zero,
   output reg       carry,
   output reg       overflow
);
	always @(*)
		case(op)
			3'b000 : begin
				{carry,result} = a + b;
				overflow = a[7]&b[7]&~result[7]|~a[7]&~b[7]&result[7];
			end
			3'b001 : begin
				{carry,result} = a + ~b + 1;
				overflow = 0;
			end
			3'b010 : begin
				result = a & b;
				overflow = 0;
				carry = 0;
			end
			3'b011 : begin
				result = a | b;
				overflow = 0;
				carry = 0;
			end
			3'b100 : begin
				result = a ^ b;
				overflow = 0;
				carry = 0;
			end
			3'b101 : begin
				{carry,result} = {a,1'b0};
				overflow = 0;
			end
			3'b110 : begin
				{result,carry} = {1'b0,a};
				overflow = 0;
			end
		endcase
	assign zero = ~(|result);
endmodule

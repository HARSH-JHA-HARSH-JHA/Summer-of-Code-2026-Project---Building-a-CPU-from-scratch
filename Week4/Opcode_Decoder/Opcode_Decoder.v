module Opcode_Decoder(
	input [5:0] C,
	output NOOP,
	output INPUTC,
	output INPUTCF,
	output INPUTD,
	output INPUTDF,
	output MOVE,
	output LOADI,
	output ADD,
	output ADDI,
	output SUB,
	output SUBI,
	output LOAD,
	output LOADF,
	output STORE,
	output STOREF,
	output SHIFTL,
	output SHIFTR,
	output CMP,
	output JUMP,
	output BRE,
	output BRNE,
	output BRG,
	output BRGE
);
	
	reg [15:0] y16;
	
	always @(*)
		case(C[5:2])
			4'h0: y16 = 16'h0001;
			4'h1: y16 = 16'h0002;
			4'h2: y16 = 16'h0004;
			4'h3: y16 = 16'h0008;
			4'h4: y16 = 16'h0010;
			4'h5: y16 = 16'h0020;
			4'h6: y16 = 16'h0040;
			4'h7: y16 = 16'h0080;
			4'h8: y16 = 16'h0100;
			4'h9: y16 = 16'h0200;
			4'ha: y16 = 16'h0400;
			4'hb: y16 = 16'h0800;
			4'hc: y16 = 16'h1000;
			4'hd: y16 = 16'h2000;
			4'he: y16 = 16'h4000;
			4'hf: y16 = 16'h8000;
		endcase
		
	reg [3:0] y4_IN;
		
	always @(*)
		if (y16[1]) begin
			case(C[1:0])
				0: y4_IN = 4'h1;
				1: y4_IN = 4'h2;
				2: y4_IN = 4'h4;
				3: y4_IN = 4'h8;
			endcase
		end
		else y4_IN = 0;
		
	reg [3:0] y4_BR;
		
	always @(*)
		if (y16[15]) begin
			case(C[1:0])
				0: y4_BR = 4'h1;
				1: y4_BR = 4'h2;
				2: y4_BR = 4'h4;
				3: y4_BR = 4'h8;
			endcase
		end
		else y4_BR = 0;
		
	reg [1:0] y2;
	
	always @(*)
		if (y16[12]) begin
			case(C[0])
				0: y2 = 1;
				1: y2 = 2;
			endcase
		end
		else y2 = 0;
		
	assign NOOP = y16[0];
	assign MOVE = y16[2];
	assign LOADI = y16[3];
	assign ADD = y16[4];
	assign ADDI = y16[5];
	assign SUB = y16[6];
	assign SUBI = y16[7];
	assign LOAD = y16[8];
	assign LOADF = y16[9];
	assign STORE = y16[10];
	assign STOREF = y16[11];
	assign CMP = y16[13];
	assign JUMP = y16[14];
	
	assign {INPUTDF, INPUTD, INPUTCF, INPUTC} = y4_IN;
	assign {SHIFTR, SHIFTL} = y2;
	assign {BRGE, BRG, BRNE, BRE} = y4_BR;
		
endmodule
	
	
	
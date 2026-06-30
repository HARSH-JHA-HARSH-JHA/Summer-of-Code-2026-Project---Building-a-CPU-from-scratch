module control(
	input clk,
	input reset,
	input NOOP,
	input INPUTC,
	input INPUTCF,
	input INPUTD,
	input INPUTDF,
	input MOVE,
	input LOADI,
	input ADD,
	input ADDI,
	input SUB,
	input SUBI,
	input LOAD,
	input LOADF,
	input STORE,
	input STOREF,
	input SHIFTL,
	input SHIFTR,
	input CMP,
	input JUMP,
	input BRE,
	input BRNE,
	input BRG,
	input BRGE,
	input o,
	input n,
	input z,
	input [1:0] X,
	input [1:0] Y,
	output reg [18:1] C,
	output reg ena_alu,
	output reg ena_X,
	output reg ena_Y,
	output reg ena_dmem,
	output reg ena_cmem
);

	reg [3:0] state, next_state;
	
	always @(posedge clk, posedge reset)
		if(reset) state <= 0;
		else state <= next_state;
		
	always @(*)
		case(state)
			0: next_state <= 1;
			1: begin
				if(CMP|SUB|ADD|SHIFTL|SHIFTR|SUBI|ADDI|STORE|STOREF|LOADF|MOVE) next_state <= 2;
				else if(LOAD) next_state <= 8;
				else if(LOADI) next_state <= 9;
				else if(NOOP|BRE&~z|BRNE&z|BRG&~(~z&~(n^o))|BRGE&(n^o)) next_state <= 5;
				else if(JUMP|BRE&z|BRNE&~z|BRG&~z&~(n^o)|BRGE&~(n^o)) next_state <= 10;
				else next_state <= 0;
			end
			2: begin
				if(SUB|ADD|SHIFTL|SHIFTR|SUBI|ADDI|STOREF|LOADF|MOVE) next_state <= 3;
				else if(CMP) next_state <= 6;
				else if(STORE) next_state <= 7;
				else next_state <= 0;
			end
			3: begin
				if(SUB|ADD|SHIFTL|SHIFTR|SUBI|ADDI|MOVE) next_state <= 4;
				else if(LOADF) next_state <= 8;
				else if(STOREF) next_state <= 7;
				else next_state <= 0;
			end
			4,6,7,9: next_state <= 5;
			8: next_state <= 9;
			5,10: next_state <= 0;
			default: next_state <= 0;
		endcase
		
	always @(*)
		 case(state)
			0: begin
				C <= 0;
				ena_alu <= 0;
				ena_X <= 0;
				ena_Y <= 0;
				ena_dmem <= 0;
				ena_cmem <= 1;
			end
			1: begin
				C <= 0;
				ena_alu <= 0;
				ena_X <= 0;
				ena_Y <= 0;
				ena_dmem <= 0;
				ena_cmem <= 0;
			end
			2: begin
				if(ADD|SUB|SHIFTL|SHIFTR|CMP) C <= {11'b000_000_000_00,Y[0],Y[1],X[0],X[1],3'b000};
				else if(STORE) C <= {11'b000_000_000_00,X[0],X[1],Y[0],Y[1],3'b000};
				else if(SUBI|ADDI|MOVE) C <= {11'b000_000_010_00,Y[0],Y[1],X[0],X[1],3'b000};
				else if(STOREF|LOADF) C <= {11'b000_000_010_00,X[0],X[1],Y[0],Y[1],3'b000};
				else C <= 0;
				ena_alu <= 0;
				ena_X <= 1;
				ena_Y <= 1;
				ena_dmem <= 0;
				ena_cmem <= 0;
			end
			3: begin
				if(ADD) C <= 18'b000_000_100_000_000_000;
				else if(ADDI|MOVE|STOREF|LOADF) C <= 18'b000_000_110_000_000_000;
				else if(SUB) C <= 18'b000_001_100_000_000_000;
				else if(SUBI) C <= 18'b000_001_110_000_000_000;
				else if(SHIFTL) C <= 18'b000_000_000_000_000_000;
				else if(SHIFTR) C <= 18'b000_001_000_000_000_000;
				else C <= 0;
				ena_alu <= 1;
				ena_X <= 0;
				ena_Y <= 0;
				ena_dmem <= 0;
				ena_cmem <= 0;
			end
			4: begin
				C <= {9'b000_010_001,X[0],X[1],7'b000_0000};
				ena_alu <= 0;
				ena_X <= 0;
				ena_Y <= 0;
				ena_dmem <= 0;
				ena_cmem <= 0;
			end
			5: begin
				C <= 18'b000_000_000_000_000_100;
				ena_alu <= 0;
				ena_X <= 0;
				ena_Y <= 0;
				ena_dmem <= 0;
				ena_cmem <= 0;
			end
			6: begin
				C <= 18'b000_011_100_000_000_000;
				ena_alu <= 0;
				ena_X <= 0;
				ena_Y <= 0;
				ena_dmem <= 0;
				ena_cmem <= 0;
			end
			7: begin
				C <= 18'b010_000_000_000_000_000;
				ena_alu <= 0;
				ena_X <= 0;
				ena_Y <= 0;
				ena_dmem <= 0;
				ena_cmem <= 0;
			end
			8: begin
				if(LOAD) C <= 18'b000_100_000_000_000_000;
				else if(LOADF) C <= 18'b000_000_000_000_000_000;
				else C <= 0;
				ena_alu <= 0;
				ena_X <= 0;
				ena_Y <= 0;
				ena_dmem <= 1;
				ena_cmem <= 0;
			end
			9: begin
				if(LOADI) C <= {9'b000_100_001,X[0],X[1],7'b000_0000};
				else if(LOAD|LOADF) C <= {9'b100_000_001,X[0],X[1],7'b000_0000};
				else C <= 0;
				ena_alu <= 0;
				ena_X <= 0;
				ena_Y <= 0;
				ena_dmem <= 0;
				ena_cmem <= 0;
			end
			10: begin
				C <= 18'b000_000_000_000_000_110;
				ena_alu <= 0;
				ena_X <= 0;
				ena_Y <= 0;
				ena_dmem <= 0;
				ena_cmem <= 0;
			end
			default: begin
				C <= 0;
				ena_alu <= 0;
				ena_X <= 0;
				ena_Y <= 0;
				ena_dmem <= 0;
				ena_cmem <= 0;
			end
		endcase
					
endmodule
				
				
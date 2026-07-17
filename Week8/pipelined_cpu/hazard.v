module hazard(
	input [1:0] ins_2_Rx,
	input [1:0] ins_2_Ry,
	input [1:0] ins_4_Rx,
	input [1:0] ins_4_Ry,
	input [1:0] ins_5_Rx,
	input [1:0] ins_5_Ry,
	input [1:0] ins_6_Rx,
	input [1:0] ins_6_Ry,
	input [1:0] ins_7_Rx,
	input [1:0] ins_7_Ry,
	input [3:0] fl_1,
	input [23:1] dec_0,
	input [23:1] dec_2,
	input [23:1] dec_3,
	input [23:1] dec_4,
	input [23:1] dec_5,
	output reg flush,
	output reg stall,
	output reg [7:0] h
);
	parameter NOOP = 1;
	parameter INPUTC = 2;
	parameter INPUTCF = 3;
	parameter INPUTD = 4;
	parameter INPUTDF = 5;
	parameter MOVE = 6;
	parameter LOADI = 7;
	parameter ADD = 8;
	parameter ADDI = 9;
	parameter SUB = 10;
	parameter SUBI = 11;
	parameter LOAD = 12;
	parameter LOADF = 13;
	parameter STORE = 14;
	parameter STOREF = 15;
	parameter SHIFTL = 16;
	parameter SHIFTR = 17;
	parameter CMP = 18;
	parameter JUMP = 19;
	parameter BRE = 20;
	parameter BRNE = 21;
	parameter BRG = 22;
	parameter BRGE = 23;
	
	always @(*) begin
		if((dec_2[ADDI]|dec_2[SUBI]|dec_2[SHIFTL]|dec_2[SHIFTR]|dec_2[ADD]|dec_2[SUB]|dec_2[MOVE])&&(ins_4_Rx == ins_2_Rx)&&(dec_0[ADDI]|dec_0[SUBI]|dec_0[SHIFTL]|dec_0[SHIFTR]|dec_0[ADD]|dec_0[SUB]|dec_0[CMP])) h[2:0] = 3'b001;
		else if(dec_2[LOADI]&&(ins_4_Rx == ins_2_Rx)&&(dec_0[ADDI]|dec_0[SUBI]|dec_0[SHIFTL]|dec_0[SHIFTR]|dec_0[ADD]|dec_0[SUB]|dec_0[CMP])) h[2:0] = 3'b010;
		else if((dec_3[ADDI]|dec_3[SUBI]|dec_3[SHIFTL]|dec_3[SHIFTR]|dec_3[ADD]|dec_3[SUB]|dec_3[MOVE]|dec_3[LOADI]|dec_3[LOAD]|dec_3[LOADF])&&(ins_5_Rx == ins_2_Rx)&&(dec_0[ADDI]|dec_0[SUBI]|dec_0[SHIFTL]|dec_0[SHIFTR]|dec_0[ADD]|dec_0[SUB]|dec_0[CMP])) h[2:0] = 3'b011;
		else if((dec_4[ADDI]|dec_4[SUBI]|dec_4[SHIFTL]|dec_4[SHIFTR]|dec_4[ADD]|dec_4[SUB]|dec_4[MOVE]|dec_4[LOADI]|dec_4[LOAD]|dec_4[LOADF])&&(ins_6_Rx == ins_2_Rx)&&(dec_0[ADDI]|dec_0[SUBI]|dec_0[SHIFTL]|dec_0[SHIFTR]|dec_0[ADD]|dec_0[SUB]|dec_0[CMP])) h[2:0] = 3'b100;
		else h[2:0] = 3'b000;
	end
	
	always @(*) begin
		if((dec_2[ADDI]|dec_2[SUBI]|dec_2[SHIFTL]|dec_2[SHIFTR]|dec_2[ADD]|dec_2[SUB]|dec_2[MOVE])&&(ins_4_Rx == ins_2_Ry)&&(dec_0[ADD]|dec_0[SUB]|dec_0[MOVE]|dec_0[CMP]|dec_0[LOADF]|dec_0[STOREF])) h[5:3] = 3'b001;
		else if(dec_2[LOADI]&&(ins_4_Rx == ins_2_Ry)&&(dec_0[ADD]|dec_0[SUB]|dec_0[MOVE]|dec_0[CMP]|dec_0[LOADF]|dec_0[STOREF])) h[5:3] = 3'b010;
		else if((dec_3[ADDI]|dec_3[SUBI]|dec_3[SHIFTL]|dec_3[SHIFTR]|dec_3[ADD]|dec_3[SUB]|dec_3[MOVE]|dec_3[LOADI]|dec_3[LOAD]|dec_3[LOADF])&&(ins_5_Rx == ins_2_Ry)&&(dec_0[ADD]|dec_0[SUB]|dec_0[MOVE]|dec_0[CMP]|dec_0[LOADF]|dec_0[STOREF])) h[5:3] = 3'b011;
		else if((dec_4[ADDI]|dec_4[SUBI]|dec_4[SHIFTL]|dec_4[SHIFTR]|dec_4[ADD]|dec_4[SUB]|dec_4[MOVE]|dec_4[LOADI]|dec_4[LOAD]|dec_4[LOADF])&&(ins_6_Rx == ins_2_Ry)&&(dec_0[ADD]|dec_0[SUB]|dec_0[MOVE]|dec_0[CMP]|dec_0[LOADF]|dec_0[STOREF])) h[5:3] = 3'b100;		
		else h[5:3] = 3'b000;
	end
	
	always @(*) begin
		if((dec_3[ADDI]|dec_3[SUBI]|dec_3[SHIFTL]|dec_3[SHIFTR]|dec_3[ADD]|dec_3[SUB]|dec_3[MOVE]|dec_3[LOADI]|dec_3[LOAD]|dec_3[LOADF])&&(ins_5_Rx == ins_4_Rx)&&(dec_2[STOREF]|dec_2[STOREF])) h[7:6] = 2'b01;
		else if((dec_4[ADDI]|dec_4[SUBI]|dec_4[SHIFTL]|dec_4[SHIFTR]|dec_4[ADD]|dec_4[SUB]|dec_4[MOVE]|dec_4[LOADI]|dec_4[LOAD]|dec_4[LOADF])&&(ins_6_Rx == ins_4_Rx)&&(dec_2[STOREF]|dec_2[STOREF])) h[7:6] = 2'b10;
		else if((dec_5[ADDI]|dec_5[SUBI]|dec_5[SHIFTL]|dec_5[SHIFTR]|dec_5[ADD]|dec_5[SUB]|dec_5[MOVE]|dec_5[LOADI]|dec_5[LOAD]|dec_5[LOADF])&&(ins_7_Rx == ins_4_Rx)&&(dec_2[STOREF]|dec_2[STOREF])) h[7:6] = 2'b11;		
		else h[7:6] = 2'b00;
	end
	
	always @(*) begin
		if(((dec_2[LOAD]|dec_2[LOADF])&&(ins_4_Rx == ins_2_Rx)&&(dec_0[ADDI]|dec_0[SUBI]|dec_0[SHIFTL]|dec_0[SHIFTR]|dec_0[ADD]|dec_0[SUB]|dec_0[CMP]))||((dec_2[LOAD]|dec_2[LOADF])&&(ins_4_Rx == ins_2_Ry)&&(dec_0[ADD]|dec_0[SUB]|dec_0[MOVE]|dec_0[CMP]|dec_0[LOADF]|dec_0[STOREF]))||((dec_2[ADDI]|dec_2[SUBI]|dec_2[SHIFTL]|dec_2[SHIFTR]|dec_2[ADD]|dec_2[SUB]|dec_2[CMP])&&(dec_0[BRE]|dec_0[BRNE]|dec_0[BRG]|dec_0[BRGE]))) begin
			stall = 1;
			flush = 0;
		end
		else if(dec_0[JUMP]|(dec_0[BRE]&fl_1[0])|(dec_0[BRNE]&~fl_1[0])|(dec_0[BRG]&~fl_1[0]&~(fl_1[1]^fl_1[2]))|(dec_0[BRGE]&~(fl_1[1]^fl_1[2]))) begin
			stall = 0;
			flush = 1;
		end
		else begin
			stall = 0;
			flush = 0;
		end
	end
	
endmodule
	
	
			
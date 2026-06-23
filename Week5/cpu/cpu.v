module cpu(
	input clk, reset,
	input [15:0] sw,
	output [127:0] out,
	
	output [18:1] debug_con,
	output [15:0] debug_instr,
	output [23:1] debug_ohe,

	output [7:0] debug_sel_1,
	output [7:0] debug_sel_2,
	output [7:0] debug_sel_3,

	output [7:0] debug_temp_1,
	output [7:0] debug_temp_2,

	output [7:0] debug_alures,
	output [7:0] debug_opd_1,
	output [7:0] debug_opd_2,

	output [5:0] debug_pc,

	output [3:0] debug_fl,
	output [3:0] debug_conz,
	
	output [31:0] debug_regs
);

	wire [18:1] con;
	wire [15:0] instr;
	wire [23:1] ohe;
	wire [7:0] sel_1, sel_2, sel_3, temp_1, temp_2, alures, opd_1, opd_2;
	wire [5:0] pc_out;
	wire [3:0] fl;
	wire [3:0] conz; 
	
	assign debug_con    = con;
	assign debug_instr  = instr;
	assign debug_ohe    = ohe;

	assign debug_sel_1  = sel_1;
	assign debug_sel_2  = sel_2;
	assign debug_sel_3  = sel_3;

	assign debug_temp_1 = temp_1;
	assign debug_temp_2 = temp_2;

	assign debug_alures = alures;
	assign debug_opd_1  = opd_1;
	assign debug_opd_2  = opd_2;

	assign debug_pc     = pc_out;

	assign debug_fl     = fl;
	assign debug_conz   = conz;
		
	cmem co(clk,reset,con[1],pc_out,sel_1[5:0],sw,instr);
	
	decoder d({instr[15:12],instr[9:8]},ohe[1],ohe[2],ohe[3],ohe[4],ohe[5],ohe[6],ohe[7],ohe[8],ohe[9],ohe[10],ohe[11],ohe[12],ohe[13],ohe[14],ohe[15],ohe[16],ohe[17],ohe[18],ohe[19],ohe[20],ohe[21],ohe[22],ohe[23]);
	
	control cnt(ohe,instr[11:10],instr[9:8],conz[2:0],con);
	
	alu a(opd_1,opd_2,{con[12],con[13]},alures,fl[0],fl[3],fl[2],fl[1]);
	
	mux2 alur(alures,instr[7:0],con[15],sel_1);
	
	mux2 alus(temp_1,instr[7:0],con[11],opd_2);
	
	regfile rf(clk,reset,con[10],{con[4],con[5]},{con[6],con[7]},{con[8],con[9]},sel_2,opd_1,temp_1,debug_regs);
	
	flag f(clk,con[14],reset,fl,conz);
	
	dmem da(clk,reset,con[17],sel_1[3:0],temp_2,sel_3,out);
	
	mux2 dm(temp_1,sw[7:0],con[16],temp_2);
	
	mux2 wb(sel_1,sel_3,con[18],sel_2);
	
	pc p(clk,reset,con[3],con[2],instr[5:0],pc_out);
	
endmodule 
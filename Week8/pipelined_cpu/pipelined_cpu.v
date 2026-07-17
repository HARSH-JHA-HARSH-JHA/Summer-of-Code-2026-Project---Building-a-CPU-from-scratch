module pipelined_cpu(
	input clk,
	input rst,
	
	output [127:0] data,
	output [31:0] regs,
	
	output [5:0] pc_0,
	output [5:0] pc_1,
	
	output flush,
	output stall,
	output [7:0] h,
	
	output [15:0] ins_0,
	output [15:0] ins_1,
	output [15:0] ins_2,
	output [15:0] ins_3,
	output [15:0] ins_4,
	output [15:0] ins_5,
	output [15:0] ins_6,
	output [15:0] ins_7,
	
	output [23:1] dec_0,
	output [23:1] dec_1,
	output [23:1] dec_2,
	output [23:1] dec_3,
	output [23:1] dec_4,
	output [23:1] dec_5,
	
	output [8:0] con_0,
	output [8:0] con_1,
	output [8:0] con_2,
	output [8:0] con_3,
	output [8:0] con_4,
	
	output [7:0] r_0,
	output [7:0] r_1,
	
	output [7:0] read_0,
	output [7:0] read_1,
	output [7:0] read_2,
	output [7:0] read_3,
	output [7:0] read_4,
	output [7:0] read_5,
	output [7:0] read_6,
	
	output [7:0] temp_0,
	output [7:0] temp_1,
	
	output [7:0] res_0,
	output [7:0] res_1,
	output [7:0] res_2,
	output [7:0] res_3,
	output [7:0] res_4,
	
	output [3:0] fl_0,
	output [3:0] fl_1,
	
	output [7:0] din_0,
	output [7:0] din_1,
	output [7:0] dsel,
	output [7:0] dout
	
);

	cmem code(clk,rst,0,pc_0,0,0,ins_0);
	dmem dat(clk,rst,con_3[6],dsel[3:0],din_1,dout,data);
	regfile regf(clk,rst,con_4[8],ins_2[11:10],ins_2[9:8],ins_6[11:10],res_3,r_0,r_1,regs);
	
	decoder dec({ins_2[15:12],ins_2[9:8]},dec_0[1],dec_0[2],dec_0[3],dec_0[4],dec_0[5],dec_0[6],dec_0[7],dec_0[8],dec_0[9],dec_0[10],dec_0[11],dec_0[12],dec_0[13],dec_0[14],dec_0[15],dec_0[16],dec_0[17],dec_0[18],dec_0[19],dec_0[20],dec_0[21],dec_0[22],dec_0[23]);
	control cnt(dec_0,con_0);
	hazard hz(ins_2[11:10],ins_2[9:8],ins_4[11:10],ins_4[9:8],ins_5[11:10],ins_5[9:8],ins_6[11:10],ins_6[9:8],ins_7[11:10],ins_7[9:8],fl_1,dec_0,dec_2,dec_3,dec_4,dec_5,flush,stall,h);
	
	alu al(read_6,read_5,con_2[3:2],res_0,fl_0[0],fl_0[3],fl_0[2],fl_0[1]);
	flag fl(clk,con_2[4],rst,fl_0,fl_1);
	pc p(clk,rst,~stall,flush,ins_2[5:0],pc_1,pc_0);
	
	mux2 #(16) m2_1(ins_0,0,flush,ins_1);
	mux2 #(16) m2_2(ins_2,0,stall,ins_3);
	mux2 #(23) m2_3(dec_0,1,stall,dec_1);
	mux2 #(9) m2_4(con_0,0,stall,con_1);
	mux2 m2_5(read_2,read_3,con_2[0],read_6);
	mux2 m2_6(read_3,read_2,con_2[0],read_4);
	mux2 m2_7(read_4,ins_4[7:0],con_2[1],read_5);
	mux2 m2_8(ins_5[7:0],res_1,con_3[5],dsel);
	mux2 m2_9(dsel,dout,con_3[7],res_2);
	mux2 m2_10(temp_0,res_3,h[2],read_0);
	mux2 m2_11(temp_1,res_3,h[5],read_1);
	
	mux4 m4_1(r_0,res_0,ins_4[7:0],res_2,h[1:0],temp_0);
	mux4 m4_2(r_1,res_0,ins_4[7:0],res_2,h[4:3],temp_1);
	mux4 m4_3(read_2,res_2,res_3,res_4,h[7:6],din_0);
	
	register #(16) reg_1(clk,rst,~stall,ins_1,ins_2);
	register #(6) reg_2(clk,rst,~stall,pc_0,pc_1);
	
	register #(16) reg_3(clk,rst,1,ins_3,ins_4);
	register #(23) reg_4(clk,rst,1,dec_1,dec_2);
	register #(9) reg_5(clk,rst,1,con_1,con_2);
	register reg_6(clk,rst,1,read_0,read_2);
	register reg_7(clk,rst,1,read_1,read_3);
	
	register #(16) reg_8(clk,rst,1,ins_4,ins_5);
	register #(23) reg_9(clk,rst,1,dec_2,dec_3);
	register #(9) reg_10(clk,rst,1,con_2,con_3);
	register reg_11(clk,rst,1,res_0,res_1);
	register reg_12(clk,rst,1,din_0,din_1);
	
	register #(16) reg_13(clk,rst,1,ins_5,ins_6);
	register #(23) reg_14(clk,rst,1,dec_3,dec_4);
	register #(9) reg_15(clk,rst,1,con_3,con_4);
	register reg_16(clk,rst,1,res_2,res_3);
	
	register #(16) reg_17(clk,rst,1,ins_6,ins_7);
	register #(23) reg_18(clk,rst,1,dec_4,dec_5);
	register reg_19(clk,rst,1,res_3,res_4);
	
endmodule
	
	
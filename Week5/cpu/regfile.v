// Week 2 — Register File (4 x 8-bit)
// regs[0]=A, regs[1]=B, regs[2]=C, regs[3]=D
// Reads: asynchronous | Write: synchronous, gated by we

module regfile(
   input        clk, rst, we,
   input  [1:0] raddr0, raddr1, waddr,
   input  [7:0] wdata,
   output reg [7:0] rdata0, rdata1,
	output  [31:0] debug_regs
);
	 reg [7:0] regs [3:0];
	
   always @(posedge clk, posedge rst)
		if(rst) begin
			regs[0] <= 8'h00;
			regs[1] <= 8'h00;
			regs[2] <= 8'h00;
			regs[3] <= 8'h00;
		end
		else if (we) regs[waddr] <= wdata;
	always @(*) rdata0 = regs[raddr0];
	always @(*) rdata1 = regs[raddr1];
	
	assign debug_regs = {regs[0],regs[1],regs[2],regs[3]};
endmodule 
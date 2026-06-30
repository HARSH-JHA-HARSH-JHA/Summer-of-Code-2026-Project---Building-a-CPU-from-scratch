// Week 2 — Program Counter (6-bit)

module pc(
   input            clk, rst, en, offset,
   input      [5:0] offset_val,
   output reg [5:0] pc_out
);
	
   always @(posedge clk, posedge rst)
		if(rst) pc_out <= 0;
		else if(en) begin
			if(offset) pc_out <= pc_out + 1 + offset_val;
			else pc_out <= pc_out + 1;
		end
      else pc_out <= pc_out;     
endmodule 
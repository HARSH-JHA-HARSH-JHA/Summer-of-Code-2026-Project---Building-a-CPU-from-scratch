module tb_Opcode_Decoder();
	
	reg [5:0] C;
	wire [22:0] y;

	Opcode_Decoder dut(C,y[0],y[1],y[2],y[3],y[4],y[5],y[6],y[7],y[8],y[9],y[10],y[11],y[12],y[13],y[14],y[15],y[16],y[17],y[18],y[19],y[20],y[21],y[22]);

	reg count;

	initial begin
		count = 0;
		C = 6'd0; #10;
		if(y !== 23'h1) begin
			$display ("NOOP failed.");
			count = 1;
		end
		C = 6'd1; #10;
		if(y !== 23'h1) begin
			$display ("NOOP failed.");
			count = 1;
		end 
		C = 6'd2; #10;
		if(y !== 23'h1) begin
			$display ("NOOP failed.");
			count = 1;
		end 
		C = 6'd3; #10;
		if(y !== 23'h1) begin
			$display ("NOOP failed.");
			count = 1;
		end 
		C = 6'd4; #10;
		if(y !== 23'h2) begin
			$display ("INPUTC failed.");
			count = 1;
		end
		C = 6'd5; #10;
		if(y !== 23'h4) begin
			$display ("INPUTCF failed.");
			count = 1;
		end 
		C = 6'd6; #10;
		if(y !== 23'h8) begin
			$display ("INPUTD failed.");
			count = 1;
		end 
		C = 6'd7; #10;
		if(y !== 23'h10) begin
			$display ("INPUTDF failed.");
			count = 1;
		end 
		C = 6'd8; #10;
		if(y !== 23'h20) begin
			$display ("MOVE failed.");
			count = 1;
		end
		C = 6'd9; #10;
		if(y !== 23'h20) begin
			$display ("MOVE failed.");
			count = 1;
		end 
		C = 6'd10; #10;
		if(y !== 23'h20) begin
			$display ("MOVE failed.");
			count = 1;
		end 
		C = 6'd11; #10;
		if(y !== 23'h20) begin
			$display ("MOVE failed.");
			count = 1;
		end 
		C = 6'd12; #10;
		if(y !== 23'h40) begin
			$display ("LOADI failed.");
			count = 1;
		end
		C = 6'd13; #10;
		if(y !== 23'h40) begin
			$display ("LOADI failed.");
			count = 1;
		end 
		C = 6'd14; #10;
		if(y !== 23'h40) begin
			$display ("LOADI failed.");
			count = 1;
		end 
		C = 6'd15; #10;
		if(y !== 23'h40) begin
			$display ("LOADI failed.");
			count = 1;
		end 
		C = 6'd16; #10;
		if(y !== 23'h80) begin
			$display ("ADD failed.");
			count = 1;
		end
		C = 6'd17; #10;
		if(y !== 23'h80) begin
			$display ("ADD failed.");
			count = 1;
		end 
		C = 6'd18; #10;
		if(y !== 23'h80) begin
			$display ("ADD failed.");
			count = 1;
		end 
		C = 6'd19; #10;
		if(y !== 23'h80) begin
			$display ("ADD failed.");
			count = 1;
		end 
		C = 6'd20; #10;
		if(y !== 23'h100) begin
			$display ("ADDI failed.");
			count = 1;
		end
		C = 6'd21; #10;
		if(y !== 23'h100) begin
			$display ("ADDI failed.");
			count = 1;
		end 
		C = 6'd22; #10;
		if(y !== 23'h100) begin
			$display ("ADDI failed.");
			count = 1;
		end 
		C = 6'd23; #10;
		if(y !== 23'h100) begin
			$display ("ADDI failed.");
			count = 1;
		end 
		C = 6'd24; #10;
		if(y !== 23'h200) begin
			$display ("SUB failed.");
			count = 1;
		end
		C = 6'd25; #10;
		if(y !== 23'h200) begin
			$display ("SUB failed.");
			count = 1;
		end 
		C = 6'd26; #10;
		if(y !== 23'h200) begin
			$display ("SUB failed.");
			count = 1;
		end 
		C = 6'd27; #10;
		if(y !== 23'h200) begin
			$display ("SUB failed.");
			count = 1;
		end 
		C = 6'd28; #10;
		if(y !== 23'h400) begin
			$display ("SUBI failed.");
			count = 1;
		end
		C = 6'd29; #10;
		if(y !== 23'h400) begin
			$display ("SUBI failed.");
			count = 1;
		end 
		C = 6'd30; #10;
		if(y !== 23'h400) begin
			$display ("SUBI failed.");
			count = 1;
		end 
		C = 6'd31; #10;
		if(y !== 23'h400) begin
			$display ("SUBI failed.");
			count = 1;
		end 
		C = 6'd32; #10;
		if(y !== 23'h800) begin
			$display ("LOAD failed.");
			count = 1;
		end
		C = 6'd33; #10;
		if(y !== 23'h800) begin
			$display ("LOAD failed.");
			count = 1;
		end 
		C = 6'd34; #10;
		if(y !== 23'h800) begin
			$display ("LOAD failed.");
			count = 1;
		end 
		C = 6'd35; #10;
		if(y !== 23'h800) begin
			$display ("LOAD failed.");
			count = 1;
		end 
		C = 6'd36; #10;
		if(y !== 23'h1000) begin
			$display ("LOADF failed.");
			count = 1;
		end
		C = 6'd37; #10;
		if(y !== 23'h1000) begin
			$display ("LOADF failed.");
			count = 1;
		end 
		C = 6'd38; #10;
		if(y !== 23'h1000) begin
			$display ("LOADF failed.");
			count = 1;
		end 
		C = 6'd39; #10;
		if(y !== 23'h1000) begin
			$display ("LOADF failed.");
			count = 1;
		end
		C = 6'd40; #10;
		if(y !== 23'h2000) begin
			$display ("STORE failed.");
			count = 1;
		end 
		C = 6'd41; #10;
		if(y !== 23'h2000) begin
			$display ("STORE failed.");
			count = 1;
		end 
		C = 6'd42; #10;
		if(y !== 23'h2000) begin
			$display ("STORE failed.");
			count = 1;
		end 
		C = 6'd43; #10;
		if(y !== 23'h2000) begin
			$display ("STORE failed.");
			count = 1;
		end
		C = 6'd44; #10;
		if(y !== 23'h4000) begin
			$display ("STOREF failed.");
			count = 1;
		end 
		C = 6'd45; #10;
		if(y !== 23'h4000) begin
			$display ("STOREF failed.");
			count = 1;
		end 
		C = 6'd46; #10;
		if(y !== 23'h4000) begin
			$display ("STOREF failed.");
			count = 1;
		end 
		C = 6'd47; #10;
		if(y !== 23'h4000) begin
			$display ("STOREF failed.");
			count = 1;
		end
		C = 6'd48; #10;
		if(y !== 23'h8000) begin
			$display ("SHIFTL failed.");
			count = 1;
		end 
		C = 6'd49; #10;
		if(y !== 23'h10000) begin
			$display ("SHIFTR failed.");
			count = 1;
		end 
		C = 6'd50; #10;
		if(y !== 23'h8000) begin
			$display ("SHIFTL failed.");
			count = 1;
		end 
		C = 6'd51; #10;
		if(y !== 23'h10000) begin
			$display ("SHIFTR failed.");
			count = 1;
		end
		C = 6'd52; #10;
		if(y !== 23'h20000) begin
			$display ("CMP failed.");
			count = 1;
		end 
		C = 6'd53; #10;
		if(y !== 23'h20000) begin
			$display ("CMP failed.");
			count = 1;
		end 
		C = 6'd54; #10;
		if(y !== 23'h20000) begin
			$display ("CMP failed.");
			count = 1;
		end 
		C = 6'd55; #10;
		if(y !== 23'h20000) begin
			$display ("CMP failed.");
			count = 1;
		end
		C = 6'd56; #10;
		if(y !== 23'h40000) begin
			$display ("JUMP failed.");
			count = 1;
		end 
		C = 6'd57; #10;
		if(y !== 23'h40000) begin
			$display ("JUMP failed.");
			count = 1;
		end 
		C = 6'd58; #10;
		if(y !== 23'h40000) begin
			$display ("JUMP failed.");
			count = 1;
		end 
		C = 6'd59; #10;
		if(y !== 23'h40000) begin
			$display ("JUMP failed.");
			count = 1;
		end
		C = 6'd60; #10;
		if(y !== 23'h80000) begin
			$display ("BRE failed.");
			count = 1;
		end 
		C = 6'd61; #10;
		if(y !== 23'h100000) begin
			$display ("BRNE failed.");
			count = 1;
		end 
		C = 6'd62; #10;
		if(y !== 23'h200000) begin
			$display ("BRG failed.");
			count = 1;
		end 
		C = 6'd63; #10;
		if(y !== 23'h400000) begin
			$display ("BRGE failed.");
			count = 1;
		end 
		if(~count) $display("All testcases passed."); 
	end 
endmodule 
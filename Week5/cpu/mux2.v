// 2:1 MUX — WIDTH bits wide
module mux2 #(parameter WIDTH = 8) (
    input  [WIDTH-1:0] a, b,
    input              sel,
    output reg [WIDTH-1:0] y
);
    always @(*) y = sel?b:a;
endmodule
module retarded_clock(input wire clk, output reg ret_clk);

reg [7:0] cont;
initial
begin
	cont <= 4'b00000000;
end

always @(clk)
begin
	cont = cont + 4'b00000001;
	ret_clk <= cont[7];
end

endmodule
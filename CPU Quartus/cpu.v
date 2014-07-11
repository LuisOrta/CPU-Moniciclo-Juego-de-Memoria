/*module retarded_clock(input wire clk, output reg ret_clk);

reg [3:0] cont;
initial
begin
	cont <= 4'b0000;
end

always @(clk)
begin
	cont = cont + 4'b0001;
	ret_clk <= cont[3];
end

endmodule
*/



module clonador(input wire in, output wire [7:0] out);
	assign out[0] = in;
	assign out[1] = in;
	assign out[2] = in;
	assign out[3] = in;
	assign out[4] = in;
	assign out[5] = in;
	assign out[6] = in;
	assign out[7] = in;
endmodule


module regzero(input wire z_in, we, output reg zero);

	initial
	begin
		zero = 1'b0;
	end

	always @(z_in)
	begin
		if(we)
		begin
			zero = z_in;
		end
	end

endmodule

module cpu(input wire clk, reset, input wire [7:0] ent1, ent2, ent3, ent4, output wire [7:0] sal1, sal2, sal3, sal4, output wire [9:0] pco);

wire s_inc, s_inm, we3, z, s_out, s_in, s_inst, s_rel, z_out;
wire [2:0] op;
wire [5:0] opcode;
wire inv_reset;
wire retarded_clk;
wire [7:0] ent2_clon, ent3_clon;
assign inv_reset = !reset;

//retarded_clock(clk, retarded_clk);
regzero regzero0(z, we3, z_out);
clonador clon(ent2[7], ent2_clon);
clonador clon2(ent3[7], ent3_clon);
microc microc0(clk, inv_reset, s_inc, s_inm, we3, s_out, s_in, s_inst, s_rel, op, ent1, ent2_clon, ent3_clon, ent4, z, opcode, sal1, sal2, sal3, sal4, pco);
uc uc0(clk, inv_reset, z_out, opcode, s_inc, s_inm, we3, s_out, s_in, s_inst, s_rel, op);

endmodule
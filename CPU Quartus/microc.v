

module microc(input wire clk, reset, s_inc, s_inm, we3, s_out, s_in, s_inst, s_rel, input wire [2:0] op, input wire [7:0] entrada1, entrada2, entrada3, entrada4, output wire z, output wire [5:0] opcode, output wire [7:0] salida1, salida2, salida3, salida4, output wire [9:0] pco);

//CONEXIONES

wire [9:0] sal_mux0, sal_mux4;
wire [9:0] sal_sum0;
wire [7:0] sal_alu;
wire [9:0] sal_PC;
wire [15:0] datos;

wire [7:0] RD1;
wire [7:0] RD2;
wire [7:0] WD3;

wire e0, e1, e2, e3;
wire [7:0] sal_wp1, sal_wp2, sal_wp3, sal_wp4, sal_mux3, sal_mux1;

wire zero;


//MODULOS 
mux2 #(10) mux0 (datos[15:6], sal_sum0, s_inc, sal_mux0);
sum sum0(sal_PC, sal_mux4, sal_sum0);
registro #(10) PC(clk, reset, sal_mux0, sal_PC);
memprog meminstrucciones(clk, sal_PC, datos);
regfile bancoreg(clk, we3, datos[7:4], datos[11:8], datos[15:12], WD3, RD1, RD2);
alu alu0(RD1, RD2, op, sal_alu, zero);
mux2 #(8) mux1 (sal_alu, datos[11:4], s_inm, sal_mux1);

decoder decod0(datos[5:4], e1, e2, e3, e4);

read_reg #(8) rd1(clk, reset, e1, s_out, s_inst, RD2, datos[15:8], salida1);
read_reg #(8) rd2(clk, reset, e2, s_out, s_inst, RD2, datos[15:8], salida2);
read_reg #(8) rd3(clk, reset, e3, s_out, s_inst, RD2, datos[15:8], salida3);
read_reg #(8) rd4(clk, reset, e4, s_out, s_inst, RD2, datos[15:8], salida4);

registro #(8) wp1(clk, reset, entrada1, sal_wp1);
registro #(8) wp2(clk, reset, entrada2, sal_wp2);
registro #(8) wp3(clk, reset, entrada3, sal_wp3);
registro #(8) wp4(clk, reset, entrada4, sal_wp4);

mux4 #(8) mux3(sal_wp1, sal_wp2, sal_wp3, sal_wp4, datos[5:4], sal_mux3);

mux2 #(8) mux2(sal_mux1, sal_mux3, s_in, WD3);

mux2 #(10) mux4(10'b1, datos[15:6], s_rel, sal_mux4);

assign opcode = datos[5:0];
assign pco = sal_PC;
assign z = zero;
endmodule

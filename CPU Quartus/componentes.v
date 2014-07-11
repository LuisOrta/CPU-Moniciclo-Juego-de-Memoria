//COMPONENTES VARIOS




//Banco de registros de dos salidas y una entrada

module regfile(input  wire        clk, 
               input  wire        we3,           //se�al de habilitaci�n de escritura
               input  wire [3:0]  ra1, ra2, wa3, //direcciones de regs leidos y reg a escribir
               input  wire [7:0]  wd3, 			 //dato a escribir
               output wire [7:0]  rd1, rd2);     //datos leidos

  reg [7:0] regb[0:15]; //memoria de 16 registros de 8 bits de ancho

  // El registro 0 siempre es cero
  // se leen dos reg combinacionalmente
  // y la escritura del tercero ocurre en flanco de subida del reloj
  always @(posedge clk)
    if (we3) regb[wa3] <= wd3;	
  
  assign rd1 = (ra1 != 0) ? regb[ra1] : 0;
  assign rd2 = (ra2 != 0) ? regb[ra2] : 0;
endmodule








//modulo sumador  

module sum(input  wire [9:0] a, b, output wire [9:0] y);
  assign y = a + b;
endmodule







//modulo de registro para modelar el PC, cambia en cada flanco de subida de reloj o de reset

module registro #(parameter WIDTH = 8)(input  wire clk, reset, input  wire [WIDTH-1:0] d, output reg  [WIDTH-1:0] q);
  always @(posedge clk, posedge reset)
    if (reset) q <= 0;
    else       q <= d;
endmodule








//modulo multiplexor, cos s=1 sale d1, s=0 sale d0

module mux2 #(parameter WIDTH = 8) (input  wire [WIDTH-1:0] d0, d1, input  wire s, output wire [WIDTH-1:0] y);
  assign y = s ? d1 : d0; 
endmodule




//Decodificador 2 a 4

module decoder(input wire [1:0] in, output reg e0, e1, e2, e3);

  always  @(*)
  begin
    case(in[1:0])
    
      2'b00:
      begin
       e0 = 1'b1;
       e1 = 1'b0;
       e2 = 1'b0;
       e3 = 1'b0;
      end

      2'b01:
      begin
        e0 = 1'b0;
        e1 = 1'b1;
        e2 = 1'b0;
        e3 = 1'b0;
      end
      
      2'b10:
      begin
       e0 = 1'b0;
       e1 = 1'b0;
       e2 = 1'b1;
       e3 = 1'b0;
      end
      
      2'b11:
      begin
       e0 = 1'b0;
       e1 = 1'b0;
       e2 = 1'b0;
       e3 = 1'b1;
      end

      default:
      begin
         e0 = 1'b0;
         e1 = 1'b0;
         e2 = 1'b0;
         e3 = 1'b0;
      end
    endcase
  end
endmodule




//Registro de lectura (Guarda el valor si enable y s_out est�n activados)

module read_reg #(parameter WIDTH = 8)(input  wire clk, reset, enable, s_out, s_inst, input  wire [WIDTH-1:0] d0,input  wire [WIDTH-1:0] d1, output reg  [WIDTH-1:0] q);
  always @(posedge clk, posedge reset)
  begin
    if (reset) 
      q <= 0;
	 else
	 begin
		 if (enable && s_out) 
			q <= d0;

		 if (enable && s_inst)
			q <= d1;
	 end
  end
endmodule



//Multiplexor 4 a 1

module mux4 #(parameter WIDTH = 8) (input  wire [WIDTH-1:0] d0, d1, d2, d3, input  wire [1:0] s, output reg [WIDTH-1:0] y);
  
  always @(*)
  begin
    if(s == 2'b00) y <= d0;
    else if(s == 2'b01)  y <= d1;
    else if(s == 2'b10)  y <= d2;
    else y <= d3;
  end
endmodule




//TESTBENCH


`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulación y el paso de simulación

module cpu_tb; //Declaracion de modulo del testbench


//declaracion de señales
reg clk, reset;
wire [7:0] sal1, sal2, sal3, sal4;
reg [7:0] ent1, ent2, ent3, ent4;


//Señal de reloj
initial
  begin
      clk = 1'b0;
  end

always
  begin
    clk = !clk;
    #40;
  end


//Pulso de reset
initial
  begin
    reset = 1'b1;
    #10;
    reset = 1'b0;
  end



//instancia del modulo a testear
cpu cpu0(clk, reset,ent1, ent2, ent3, ent4, sal1, sal2, sal3, sal4);

initial
begin

  $monitor("TIEMPO=%0d RESET=%b SAL1=%b SAL2=%b SAL3=%b SAL4=%b", $time, reset, sal1, sal2, sal3, sal4);
  $dumpfile("cpu_tb.vcd");
  $dumpvars;
  ent1 = 8'b11010000;
  #900000;
  $finish;

end

endmodule

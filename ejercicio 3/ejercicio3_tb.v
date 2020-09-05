module testbench();

  reg clock,reset;//se inicializan las variables del problema
  reg A;
  wire Y1, Y2, Y3;

  always
    begin
      clock <= 1;
      #1 clock <= ~clock;// se realiza el cambio del reloj
      #1;
  end

 FSM__Moore M1(A, clock, reset, Y1, Y2, Y3);// instanciacion de la maquina de moore

  initial begin
     reset = 1;
     #1 reset = 0; // se realiza el reseteo inicial de la máquina de moore
     $display(" ejercicio 4 - Escala de gray ");
     $display("A | Y1 Y2 Y3");
     $monitor("%b |  %b  %b  %b  ", A, Y3, Y2, Y1);

     A = 1;
    #2 A = 1;
    #2 A = 1;
    #2 A = 1;
    #2 A = 0;
    #2 A = 1;
    #2 A = 1;
    #2 A = 1;
    #2 A = 1;
    #2 A = 1;//se realizan las pruebas necesarias para obtener los valores deseados
    #2 A = 1;
    #2 A = 0;
    #2 A = 0;
    #2 A = 0;
    #2 A = 0;

     #1 $finish;
   end

  initial begin
        $dumpfile("ejercicio3_tb.vcd");// se ejecuta GTKwave
        $dumpvars(0, testbench);
      end

endmodule

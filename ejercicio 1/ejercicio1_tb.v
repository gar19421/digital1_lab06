module testbench();

  reg clock,reset;// se inicializan las variables del problema
  reg A, B, A1;
  wire S0, S1, SF0, SF1;
  wire Y1;

  always// bloque alwas para realizar el cambio del reloj
    begin
      clock <= 1;
      #1 clock <= ~clock;
      #1;
  end

  FSM__Mealy M1(A, B,clock,reset,S0,S1, SF0, SF1, Y1);// instanciacion de la máquina de mealy

  initial begin
    $display("\n");
    $display("ejercicio 1 - Mealy");
    $display(" A B  | S0 S1 | SF0 SF1 | Y");
    $display(" ---------------------------");
    $monitor(" %b %b     %b  %b     %b  %b    %b ", A, B, S0, S1, SF0, SF1, Y1 );
       A = 0; B = 0;
    #2 A = 1; B = 0;
    #2 A = 1; B = 1;
    #2 A = 1; B = 1;
    #2 A = 1; B = 1;
    #2 A = 0; B = 0;
    #2 A = 1; B = 0;
    #2 A = 0; B = 0;// se realizan las pruebas necesarias para obtener los valores deseados

      #1 $finish;
  end

  initial begin
        $dumpfile("ejercicio1_tb.vcd");// se ejecuta GTKwave
        $dumpvars(0, testbench);
      end

endmodule

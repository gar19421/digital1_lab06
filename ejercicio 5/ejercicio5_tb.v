module testbench();
  reg clk1, rst1, d1, d2, d3, d4, clk2, rst2, d5, d6, d7, d8;
  wire Y1, Y2, Y3, Y4, Y5, Y6, Y7,Y8;// se inicializan las variables y conexiones

  ff__asincrono F1(clk1, rst1, {d4, d3, d2, d1}, {Y4, Y3, Y2, Y1});
  ff__sincrono F2(clk2, rst2, {d8, d7, d6, d5}, {Y8, Y7, Y6, Y5});// se instancian los flip-flops

  always begin
    #5 clk1 = !clk1;//se realiza el cambio en los relojes de cada flip-flop
  end
  always begin
    #5 clk2 = !clk2;
  end


  initial begin
    $display(" Flip Flop tipo D - Asincrono");// se ejecutan pruebas con el ff asincrono
    $display("D4 D3 D2 D1 Clk R | Y4 Y3 Y2 Y1");
    $display("------------------|------------");
    $monitor("%b  %b  %b  %b  %b  %b  |  %b  %b  %b  %b", d4, d3, d2, d1, clk1, rst1, Y4, Y3, Y2, Y1);
    clk1 = 0;
    rst1 = 0;
    d4 = 0; d3 = 0; d2 = 0; d1 = 0;
    #5 rst1 = 1;
    #10 rst1 = 0;
    #5 {d4, d3, d2, d1} = 4'b0001;
    #5 {d4, d3, d2, d1} = 4'b0010;
    #5 rst1 = 1;
    #5 {d4, d3, d2, d1} = 4'b0100;
    #5 {d4, d3, d2, d1} = 4'b1000;
    #5 {d4, d3, d2, d1} = 4'b1001;
    #5 rst1 = 0;
    #5 {d4, d3, d2, d1} = 4'b0101;
    end

    initial begin
    #60
      $display("\n Flip Flop tipo D  Sincrono");// se realizan pruebas con el ff sincrono
      $display("D8 D7 D6 D5 Clk R | Y4 Y3 Y2 Y1");
      $display("------------------|------------");
      $monitor("%b  %b  %b  %b  %b  %b  |  %b  %b  %b  %b", d8, d7, d6, d5, clk2, rst2, Y8, Y7, Y6, Y5);
      clk2 = 0;
      rst2 = 0;
      d8 = 0; d7 = 0; d6 = 0; d5 = 0;
      #5 rst2 = 1;
      #10 rst2 = 0;
      #5 {d8, d7, d6, d5} = 4'b0001;
      #5 {d8, d7, d6, d5} = 4'b0010;
      #5 rst2 = 1;
      #5 {d8, d7, d6, d5} = 4'b0100;
      #5 {d8, d7, d6, d5} = 4'b1000;
      #5 {d8, d7, d6, d5} = 4'b1001;
      #1 rst2 = 0;
      #5 {d8, d7, d6, d5} = 4'b0101;
      end

    initial
    #115 $finish;

    initial begin
      $dumpfile("ejercicio5_tb.vcd");// se ejecuta GTKwave
      $dumpvars(0, testbench);
    end

endmodule

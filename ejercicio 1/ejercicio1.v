module ff__D(input wire clock,reset,input wire D,output reg Y);//se crea el flip-flop tipo d para utilizar el circuito
  always @ (posedge clock, posedge reset) begin
    if(reset) begin
      Y <= 1'b0; // un-blocked assignament
    end
    else
      Y <= D;
    end
endmodule

module FSM__Mealy(input wire A, B,clock, reset,output wire S00, S11, SF0, SF1, Y); // modulo de la máquina de mealy
                                                                                  // que representa al ejercio 1
    wire S1 , S0;

    assign SF0 = (~S1 & ~S0 & A);
    assign SF1 = ((S0 & B) | (S1 & A & B));// se realiza las assignaciones de entradas al estado futuro

    ff__D U1(clock, reset,SF1, S1);
    ff__D U2(clock, reset,SF0, S0); //se realizan las conexiones con el flip-flop y nuestro circuito
    assign S00 = S0;
    assign S11 = S1;
    assign Y = (S1 & A & B); // se asigna el valor de salida

endmodule

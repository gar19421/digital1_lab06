module ff__D(input wire clock,reset,input wire D,output reg Y);//se crea el flip-flop tipo d para utilizar el circuito
  always @ (posedge clock, posedge reset) begin
    if(reset) begin
      Y <= 1'b0; //un-blocking assignament
    end
    else
      Y <= D;
    end
endmodule

module FSM__Moore(input wire A, clock, reset, output wire Y1, Y2, Y3); //modulo de la maquina de FSM__Moore
                                                                      // que representa el problema 3
    wire S0, S1, S2;

    assign SF0 = ((A & S2 & S1) | (~A & ~S2 & S1) | (~A & S2 & ~S1) | (A & ~S2 & ~S1));
    assign SF1 = ((S1 & ~S0) | (~A & S1 & S2) | (A & ~S2 & S0));
    assign SF2 = ((S2 & S0) | (A & S1 & ~S0) | (~A & ~S1 & ~S0));// ser realizan las conexiones entre nuestros componentes
                                                                // y el estado futuro
    ff__D U1(clock, reset, SF0, S0);// se conecta nuestro circuito y los flip-flops tipo D
    ff__D U2(clock, reset, SF1, S1);
    ff__D U3(clock, reset, SF2, S2);

    assign Y1 = S0;// Se asignan el valor de las variables de salida
    assign Y2 = S1;
    assign Y3 = S2;
endmodule

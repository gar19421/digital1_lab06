module ff__asincrono(input wire clk, reset, input wire [3:0]d, output reg [3:0]Y);//FF con reset asincrono
  always @(posedge clk, posedge reset) begin
    if (reset) Y <= 4'b0;
    else Y <= d;
  end
endmodule

module ff__sincrono(input wire clk, reset,input wire [3:0]d, output reg [3:0]Y) ;  //FF con reset síncrono
  always @(posedge clk) begin
    if (reset)  Y <= 4'b0;
    else  Y <= d;
  end
endmodule

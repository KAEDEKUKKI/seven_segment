module BCD(clk, reset, Q);
  input clk,reset;
  output [3:0] Q;
  reg  [3:0] Q;
  always@(posedge clk or posedge reset) begin
    if(reset)
      Q = 4'b0000;
    else if(Q==9)
      Q = 4'b0000;
    else
      Q = Q+1;
    end
endmodule

module dff_1(clk, D, Din, Load, Q4);
  input clk, D, Din, Load;
  output Q4;
  reg Q4;
  always@(posedge clk) begin
    if(Load)
      Q4 = Din;
    else
      Q4 = D;
  end
endmodule

module seven_segment(clk, reset, Load, Din);
  input clk, reset, Load;
  input [3:0] Din;
  input [3:0] I;
  input [3:0] In;
  output [7:0] O;
  reg [7:0] O;
  BCD block1(clk, reset, I);
  dff_1 block2(clk, I[0], Din[0], Load, In[0]);
  dff_1 block3(clk, I[1], Din[1], Load, In[1]);
  dff_1 block4(clk, I[2], Din[2], Load, In[2]);
  dff_1 block5(clk, I[3], Din[3], Load, In[3]);
  always @(In) case (In)
    4'b0000: O = 8'b11000000;
    4'b0001: O = 8'b11111001;
    4'b0010: O = 8'b10100100;
    4'b0011: O = 8'b10110000;
    4'b0100: O = 8'b10011001;
    4'b0101: O = 8'b10010010;
    4'b0110: O = 8'b10000010;
    4'b0111: O = 8'b11111000;
    4'b1000: O = 8'b10000000;
    4'b1001: O = 8'b10010000;
    4'b1010: O = 8'b10100000;
    4'b1011: O = 8'b10000011;
    4'b1100: O = 8'b10100111;
    4'b1101: O = 8'b10100001;
    4'b1110: O = 8'b10000100;
    4'b1111: O = 8'b11110001;
  endcase
endmodule

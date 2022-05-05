# seven_segment
#### [Github](https://github.com/KAEDEKUKKI/seven_segment)
## 實驗內容
- 1) Design an One bit BCD to 7 segment display with
- 1.1) negative edge synchronous reset (highest priority)
- 1.2) positive edge synchronous Load
- 2) 7 segment display is common Anode type
- 3) Writing the Verilog code and testbench
## 程式碼
BCD
```verilog=5
always@(posedge clk or posedge reset) begin
  if(reset)         //reset=1時，歸零
    Q = 4'b0000;
  else if(Q==9)
    Q = 4'b0000;
  else
    Q = Q+1;
end
```
dff_1
```verilog=19
always@(posedge clk) begin
  if(Load)      //Load=1時，輸出為載入的數
    Q4 = Din;
  else          //Load=0時，輸出BCD
    Q4 = D;
end
```
seven_segment
![](https://imgur.com/22y2sfl.png)
```verilog=34
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
```
## 結果
![](https://imgur.com/undefined.png)
## 心得
>我的想法是BCD跟七段顯示器中間用dff做連結，一開始只有想法但怎麼結合卻遲遲做不到，後來參考了第一次作業的方式後，才恍然大悟。

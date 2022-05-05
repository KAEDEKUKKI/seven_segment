module tb;
  reg clk, reset, load;
  reg [3:0] din;
  parameter PERIOD = 20;
  parameter real DUTY_CYCLE = 0.5;
  parameter OFFSET = 0;
  initial begin
    #OFFSET;
    forever begin
      clk = 1'b0;
      #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
      #(PERIOD*DUTY_CYCLE);
    end
  end

  seven_segment seven(.clk(clk), .reset(reset), .Load(load), .Din(din));
  initial begin
    reset = 1'b1;
    load = 1'b0;
    din = 4'b1111;
    #5 reset = 1'b0;
    #200 reset = 1'b1;
    #50 reset = 1'b0;
    #5 load = 1'b1;
    #10 din = 4'b1110;
    #50 load = 1'b0;
    #100 $finish;
  end
  initial begin
    $dumpfile("seven_segment.vcd");
    $dumpvars(0, seven);
  end
endmodule

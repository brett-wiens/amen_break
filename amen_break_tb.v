module amen_break_tb;

reg clock, reset;
wire [3:0] beats;

initial begin
//  $monitor ("(%t) clk=%b,b0=%b,b1=%b,b2=%b,b3=%b", $time, clock,beats[0],beats[1],beats[2],beats[3]);
  $monitor ("(%t) clk=%b,beats=%b", $time, clock,beats);
  clock = 0;
  reset = 0;
  #5 reset = 1;
  #15 reset = 0;
  #600 $finish;
end

always begin
 #5 clock = !clock;
end

amen_break U0 (
.clock (clock),
.reset (reset),
.beats (beats)

);

endmodule

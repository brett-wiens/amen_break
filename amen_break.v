module amen_break (
 clock, 
 reset, 
 beats
);
input clock, reset;
output reg [3:0] beats;

reg [5:0] index;
parameter [63:0] b0 = 64'b0000000000000000000000000000000000000000000000000000000000100000;
parameter [63:0] b1 = 64'b1010101010101010101010101010101010101010101010101010101010001010;
parameter [63:0] b2 = 64'b0000100101001001000010010100100100001001010000100100100101000010;
parameter [63:0] b3 = 64'b1010000000110000101000000011000010100000001000000011000000100000;

always @ (posedge clock or posedge reset) begin
	if(reset) begin
		index <= 6'b000000;
	end else begin
		beats[0] <= b0[index];
		beats[1] <= b1[index];
		beats[2] <= b2[index];
		beats[3] <= b3[index];
		index <= index + 1;
	end
end

endmodule

// Code your testbench here
// or browse Examples
module up_counter(input clk, reset, output[3:0] counter ); 
reg [3:0] counter_up; // up counter 
always @(posedge clk or posedge reset) 
begin 	
	if(reset) 
		counter_up <= 4'd0;    // counter_down <= 4‘hf; 
	else 
		counter_up <= counter_up + 4'd1; 
	         // counter_down <= counter_down - 4‘f1; 
end 
assign counter = counter_up; 
endmodule


// Code your design here
module upcounter_testbench; 
reg clk, reset; 
wire [3:0] counter; 
integer a;

up_counter dut(clk, reset, counter); 

initial begin 
clk=0; 
for( a=0;a<10;a++) 
#10 clk = ~clk; 
end 

initial begin 
$display("time\tclk\treset\tcounter");
$monitor("%0t\t%b\t%b\t%b",$time,clk,reset,counter); 
reset=1; 
#20 
reset=0; 
end 
endmodule
`include "memory.v"
module top;
//parameter WIDTH;
//parameter DEPTH;
//parameter ADDR_WIDTH;
reg clk,rst,wr_rd,valid;
reg [7:0]wdata;
reg [3:0]addr;
wire [7:0]rdata;
wire ready;
integer i;
memory dut(.clk(clk),.rst(rst),.addr(addr),.wdata(wdata),.rdata(rdata),.wr_rd(wr_rd),.valid(valid),.ready(ready));
always begin
	clk=0;
	#5;
	clk=1;
	#5;
end
initial begin
	rst=1;
	repeat(2)@(posedge clk);
	rst=0;
	for(i=0;i<16;i=i+1) begin@(posedge clk);
	valid=1;
	wait(ready==1);
	wr_rd=1;
	wdata=$random;
	addr=i;
	end
	for(i=0;i<16;i=i+1) begin@(posedge clk);
	valid=1;
	wait(ready==1);
	wr_rd=0;
	addr=i;
	end
	/* valid=1;
	wait(ready==1);
	wr_rd=1;
    wdata=$random;
	addr=$random;
	*/
end
initial begin
	#1000;
	$finish;
end
endmodule



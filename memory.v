module memory(clk,rst,rdata,wdata,wr_rd,addr,valid,ready);
//parameter WIDTH=8;
//parameter DEPTH=16;
//parameter ADDR_WIDTH=4;
input clk,rst,wr_rd,valid;
input [7:0]wdata;
input [3:0]addr;
output reg [7:0]rdata;
output reg ready;
integer i;
reg [7:0] mem[15:0];
always@(posedge clk) begin
	if(rst==1) begin
	rdata=0;
	ready=0;
	for(i=0;i<16;i=i+1) begin
		mem[i]=0;
	end
	end
	else begin
		if(valid==1) begin
			ready=1;
			if(wr_rd==1) begin
				mem[addr]=wdata;
			end
			else begin
				mem[addr]=rdata;
			end
		end
		else begin
			ready=0;
		end
	end
end
endmodule

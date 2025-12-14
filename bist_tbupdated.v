`timescale 1ns / 1ps

module bist_tb;

	// Inputs
	reg clk=0;
	reg rst=1;

	// Outputs
	wire [2:0] lfsr_out;
	wire fault;
    wire tsum,tcarry,Esum,Ecarry , Eqout ;
	// Instantiate the Unit Under Test (UUT)
	fault_tolernt_bist uut(clk,rst,lfsr_out ,tsum,tcarry,Esum,Ecarry , Eqout ,fault );
	
always #5 clk = !clk ;
initial #10 rst = 0 ;   
	
	
endmodule


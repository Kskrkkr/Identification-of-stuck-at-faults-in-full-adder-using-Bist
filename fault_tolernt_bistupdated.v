module fault_tolernt_bist(clk,rst,lfsr_out ,tsum,tcarry,Esum,Ecarry , Eqout ,fault );

input clk,rst;
output fault ;
output [2:0] lfsr_out ;


output tsum,tcarry ;
output  Esum,Ecarry ;
output  Eqout ;

LFSR prg(.clk(clk),.rst(rst),.lfsr_out(lfsr_out));

full_adder inst1(.A(lfsr_out[2]),.B(lfsr_out[1]),.C(lfsr_out[0]),.Sum(tsum),.Carry(tcarry));

expected_results inst2(.a(lfsr_out[2]),.b(lfsr_out[1]),.cin(lfsr_out[0]),.sum(Esum),.carry(Ecarry));

comparator  inst3(.a({tsum,tcarry}),.b({Esum,Ecarry}),.Eqout(Eqout));


assign fault = Eqout ? 1'b0 : 1'b1 ;

endmodule
//expected output 
module expected_results(a,b,cin,sum,carry);

input a,b,cin;
output reg sum,carry;

always @*
begin
	case({a,b,cin})//001
	3'd1 : begin
				sum = 1 ;
				carry = 0 ;
				end
	3'd2 : begin
				sum = 1;
				carry = 1;
				end
	3'd3 : begin
				sum = 0;
				carry = 1;
				end
	3'd4 : begin
				sum = 1 ;
				carry = 0 ;
				end
	3'd5 : begin
				sum = 0 ;
				carry = 1 ;
				end
	3'd6 : begin
				sum = 0 ;
				carry = 1 ;
				end
	3'd7 : begin
				sum = 1 ;
				carry = 1 ;
				end
	default  begin
				sum = 0 ;
				carry = 0 ;
				end
	endcase

end
endmodule 


//cut (full adder) 
module full_adder(A,B,C,Sum,Carry);

input A,B,C;
output Sum,Carry ;

xor g1(S1,A,1'b1);////xor
and g2(w1,A,B);
and g3(w2,S1,C);
xor g4(Sum, S1,C);
or g5(Carry,w1,w2);

endmodule 

//comparator 
module comparator (a,b,Eqout);

input [1:0] a,b;
output Eqout ;

assign Eqout = a == b ;

endmodule 
//lfsr
module LFSR(clk,rst,lfsr_out);

input clk ,rst ;
output reg [2:0] lfsr_out ;

assign fb = lfsr_out[0] ^ lfsr_out[2] ;

always @(posedge clk or posedge rst )
begin
	if(rst)lfsr_out <= 3'b001 ;
		
	else lfsr_out <= { fb , lfsr_out[2:1] } ;
end

endmodule

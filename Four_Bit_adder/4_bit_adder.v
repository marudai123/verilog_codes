`timescale 1ns / 1ps

module full_adder (A,B,C,Sum,Carry);
    
    input A;
    input B;
    input C;
    output Sum;
    output Carry;
    
   assign  Sum = A ^ B ^ C;
   assign Carry = (A&B)|(C & (A^B));
    
endmodule


module four_bit_adder(A,B,C,S,Carry);
    
    input[3:0] A,B;
    input C;
    output [3:0] S;
    output Carry;
    
    wire t1,t2,t3;
    
    
    full_adder mo(A[0],B[0],C,S[0],t1);
    full_adder m1(A[1],B[1],t1,S[1],t2);
    full_adder m2(A[2],B[2],t2,S[2],t3);
    full_adder m3(A[3],B[3],t3,S[3],Carry);
    
endmodule

module four_bit_ripple_carry_adder_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg C;

    wire [3:0] S;
    wire Carry;

    // Instantiate the DUT
    four_bit_ripple_carry_adder uut (
        .A(A),
        .B(B),
        .C(C),
        .S(S),
        .Carry(Carry)
    );

    initial
    begin

        
        A = 4'b0000;
        B = 4'b0000;
        C = 1'b0;
        #10;

        
        A = 4'b0001;
        B = 4'b0010;
        C = 1'b0;
        #10;

       
        A = 4'b0011;
        B = 4'b0011;
        C = 1'b0;
        #10;

       
        A = 4'b0101;
        B = 4'b0011;
        C = 1'b0;
        #10;

        
        A = 4'b0000;
        B = 4'b0000;
        C = 1'b1;
        #10;

      
        A = 4'b0010;
        B = 4'b0011;
        C = 1'b1;
        #10;

     
        A = 4'b1111;
        B = 4'b0000;
        C = 1'b1;
        #10;

      
        A = 4'b1111;
        B = 4'b1111;
        C = 1'b1;
        #10;

        $finish;

    end

   
    initial
    begin
        $monitor("Time=%0t | A=%b | B=%b | C=%b | S=%b | Carry=%b",
                 $time, A, B, C, S, Carry);
    end

endmodule
        

    

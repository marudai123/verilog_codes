
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


module Four_bit_adder_and_subtractor(
 
    input [3:0] a,
    input [3:0] b,
    input ctr,
    output [3:0] s,
    output sign_bit 
    );
    
    wire [3:0] b0;
    assign b0 = {4{ctr}} ^ b;
    wire [3:0] s0;
    wire [3:0] s1;
    wire c1;
    wire c2;
   
    
    four_bit_adder fb0 (a,b0,ctr,s0,c1);
    
    assign sign_bit = ~c1&ctr;
    assign s1       = {4{sign_bit}}^s0;
    
    four_bit_adder fb1 (4'b0000,s1,sign_bit,s,c2);
    
    
    
    
   
  
endmodule


module Four_bit_adder_and_subtractor_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg ctr;

    wire [3:0] s;
    wire sign_bit;

    // DUT
    Four_bit_adder_and_subtractor dut (
        .a(a),
        .b(b),
        .ctr(ctr),
        .s(s),
        .sign_bit(sign_bit)
    );

    initial
    begin

        
        // ADDITION : ctr = 0
       

        a = 4'b0001; b = 4'b0010; ctr = 1'b0;  
        #10;

        a = 4'b0101; b = 4'b0011; ctr = 1'b0;   
        #10;

        a = 4'b0111; b = 4'b0001; ctr = 1'b0;   
        #10;

        a = 4'b1001; b = 4'b0011; ctr = 1'b0;   
        #10;

        a = 4'b1111; b = 4'b0001; ctr = 1'b0;   
        #10;

        
        // SUBTRACTION : ctr = 1
       

        a = 4'b0101; b = 4'b0011; ctr = 1'b1;   
        #10;

        a = 4'b1000; b = 4'b0011; ctr = 1'b1;   
        #10;

        a = 4'b0111; b = 4'b0010; ctr = 1'b1;  
        #10;

        a = 4'b0011; b = 4'b0101; ctr = 1'b1;   
        #10;

        a = 4'b0000; b = 4'b0001; ctr = 1'b1;   
        #10;

        a = 4'b1111; b = 4'b0001; ctr = 1'b1;   
        #10;

        a = 4'b1010; b = 4'b0101; ctr = 1'b1;   
        #10;

        $finish;

    end

    initial
    begin
        $monitor("Time=%0t | A=%b | B=%b | CTR=%b | S=%b | Sign=%b",
                  $time, a, b, ctr, s, sign_bit);
        $display("Time=%0t | A=%b | B=%b | CTR=%b | S=%b | Sign=%b",
                  $time, a, b, ctr, s, sign_bit);
    end

endmodule
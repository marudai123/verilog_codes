`timescale 1ns / 1ps

module full_adder(a,b,carry_in,carry_out,sum);
    
    input a;
    input b;
    input carry_in;
    output  sum;
    output  carry_out;
    
    wire t1,t2,t3;
    xor g0 (t1,a,b);
    xor g1 (sum,carry_in,t1);
    and g2 (t2,carry_in,t1);
    and g3 (t3,a,b);
    or  g4 (carry_out,t2,t3);   
   
endmodule

module Subtraction_using_Adder(
    
    input  [3:0] a,
    input  [3:0] b,
    output [3:0] difference
   );
   
   wire [3:0] b0;
   wire [3:0] d;
   wire [3:0] c;
  assign b0 = ~b;
  
  full_adder fa0(a[0],b0[0],1'b1,c[0],d[0]);
  full_adder fa1(a[1],b0[1],c[0],c[1],d[1]);
  full_adder fa2(a[2],b0[2],c[1],c[2],d[2]);
  full_adder fa3(a[3],b0[3],c[2],c[3],d[3]);
  
  assign difference  = d;
  
endmodule

module Subtraction_using_Adder_tb;

    reg [3:0] a;
    reg [3:0] b;

    wire [3:0] difference;
   

    // DUT instantiation
    Subtraction_using_Adder dut (
        .a(a),
        .b(b),
        .difference(difference)
        
    );

    // Test cases
    initial
    begin
    
 a = 4'b0001; b = 4'b0000;
#10;

a = 4'b0011; b = 4'b0001;
#10;

a = 4'b0101; b = 4'b0011;
#10;

a = 4'b0111; b = 4'b0010;
#10;

a = 4'b1000; b = 4'b0001;
#10;

a = 4'b1010; b = 4'b0101;
#10;

a = 4'b1111; b = 4'b0001;
#10;
  

        $finish;
    end

    // Display results
    initial
    begin
        $monitor("Time=%0t | A=%b | B=%b | Difference=%b ",
                 $time, a, b, difference);
    end

endmodule

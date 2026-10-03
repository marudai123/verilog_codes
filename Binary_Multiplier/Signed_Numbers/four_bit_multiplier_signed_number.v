`timescale 1ns / 1ps

module half_adder(a,b,sum,carry);
    
    input a;
    input b;
    output sum;
    output carry;
    
    xor g0(sum,a,b);
    and g1(carry,a,b);
   
endmodule

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


module four_bit_multiplier_signed_numbers(
    
    input  [3:0] a,
    input  [3:0] b,
    output [7:0] product 

    );
    
    wire [12:0] c;
    wire [7:0] p0;
    wire [5:0] s;
    wire [14:0] t;
    
    assign p0[0] = a[0]&b[0];
    assign t[0]  = a[1]&b[0];
    assign t[1]  = a[0]&b[1];
    half_adder ha0 (t[0],t[1],p0[1],c[0]);
    assign t[2] = a[2]&b[0];
    assign t[3] = a[1]&b[1];
    full_adder fa0 (t[2],t[3],c[0],c[1],s[0]);
    assign t[4] = a[0]&b[2];
    half_adder ha1 (s[0],t[4],p0[2],c[2]);
    assign t[5] = ~(a[3]&b[0]);
    assign t[6] = a[2]&b[1];
    full_adder fa1 (t[5],t[6],c[1],c[3],s[1]);
    assign t[7] = a[1]&b[2];
    full_adder fa2 (t[7],s[1],c[2],c[4],s[2]);
    assign t[8] = ~(a[0]&b[3]);
    half_adder ha2 (t[8],s[2],p0[3],c[5]);
    assign t[9] = ~(a[3]&b[1]);
    full_adder fa3 (t[9],c[3],1'b1,c[6],s[3]);
    assign t[10] = a[2]&b[2];
    full_adder fa4 (t[10],s[3],c[4],c[7],s[4]);
    assign t[11] = ~(a[1]&b[3]);
    full_adder fa5 (t[11],s[4],c[5],c[8],p0[4]);
    assign t[12] = ~(a[3]&b[2]);
    full_adder fa6 (t[12],c[6],c[7],c[9],s[5]);
    assign t[13] = ~(a[2]&b[3]);
    full_adder fa7 (t[13],s[5],c[8],c[10],p0[5]);
    assign t[14] = a[3]&b[3];
    full_adder fa8 (t[14],c[9],c[10],c[11],p0[6]);
    half_adder ha3 (1'b1,c[11],p0[7],c[12]);
    
    
    assign  product = p0;
  
endmodule


`timescale 1ns / 1ps

module four_bit_multiplier_signed_numbers_tb;

    reg [3:0] a;
    reg [3:0] b;


    wire [7:0] product;

 
    four_bit_multiplier_signed_numbers dut (
        .a(a),
        .b(b),
        .product(product)
    );

    initial
    begin
       a = 4'b0010;
       b = 4'b0011;
       #10; 
       
      a = 4'b0101;
      b = 4'b0011;
      #10;  
      
       a = 4'b0011;
       b = 4'b1101;
       #10; 
        
       a = 4'b1101; 
       b = 4'b0011; 
       #10;
         
       a = 4'b1101; 
       b = 4'b1101; 
       #10;  
       
       a = 4'b0000; 
       b = 4'b0111; 
       #10;  
       
       a = 4'b1000; 
       b = 4'b0001; 
       #10;
         
       a = 4'b1000; 
       b = 4'b1000; 
       #10;
       
       $finish;
    end
    
    initial
begin
    $monitor("Time=%0t | A=%b | B=%b | Product=%b",
             $time, a, b, product);
end

endmodule




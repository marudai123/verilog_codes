`timescale 1ns / 1ps

module half_adder(a,b,sum,carry);
    
    input a;
    input b;
    output sum;
    output carry;
    
    xor g0(sum,a,b);
    and g1(carry,a,b);
   
endmodule


module two_bit_multiplier(
    
    input [1:0] a,
    input [1:0] b,
    output [3:0] p 
    
    );
    
    wire[3:0] p0;
    wire [1:0] c;
    wire t1,t2,t3;
    
    assign p0[0] = a[0]&b[0];
    assign t1 = a[1]&b[0];
    assign t2 = a[0]&b[1];
    half_adder ha0 (t1,t2,p0[1],c[0]);
    assign t3 = a[1]&b[1];
    half_adder ha1 (c[0],t3,p0[2],c[1]);
    assign p0[3] = c[1];
    assign p = p0;
    
endmodule


module two_bit_multiplier_tb;

    reg [1:0] a;
    reg [1:0] b;

    wire [3:0] p;

    
    two_bit_multiplier dut (
        .a(a),
        .b(b),
        .p(p)
    );

    initial
    begin

        a = 2'b00; b = 2'b00;
        #10;

        a = 2'b00; b = 2'b01;
        #10;

        a = 2'b00; b = 2'b10;
        #10;

        a = 2'b00; b = 2'b11;
        #10;

        a = 2'b01; b = 2'b00;
        #10;

        a = 2'b01; b = 2'b01;
        #10;

        a = 2'b01; b = 2'b10;
        #10;

        a = 2'b01; b = 2'b11;
        #10;

        a = 2'b10; b = 2'b00;
        #10;

        a = 2'b10; b = 2'b01;
        #10;

        a = 2'b10; b = 2'b10;
        #10;

        a = 2'b10; b = 2'b11;
        #10;

        a = 2'b11; b = 2'b00;
        #10;

        a = 2'b11; b = 2'b01;
        #10;

        a = 2'b11; b = 2'b10;
        #10;

        a = 2'b11; b = 2'b11;
        #10;

        $finish;
    end

  
    initial
    begin
        $monitor("Time=%0t | A=%b | B=%b | Product=%b",
                 $time, a, b, p);
    end

endmodule

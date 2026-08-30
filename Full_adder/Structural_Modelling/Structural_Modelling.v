`timescale 1s / 1s
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2026 19:21:51
// Design Name: 
// Module Name: full_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module half_adder(a, b, sum_0, carry);

    input a;
    input b;
    output sum_0;
    output carry;

    xor g0(sum_0, a, b);
    and g1(carry, a, b);

endmodule


module full_adder(a, b, carry_in, sum_1, carry_out);

    input a;
    input b;
    input carry_in;
    output sum_1;
    output carry_out;

    wire t1, t2, carry;

    half_adder m0(a, b, t1, carry);
    half_adder m1(t1, carry_in, sum_1, t2);

    or g0(carry_out, carry, t2);

endmodule


module testbench;

    reg a;
    reg b;
    reg c;

    wire sum_1;
    wire carry_out;

full_adder dut (
        .a(a),
        .b(b),
        .carry_in(c),
        .sum_1(sum_1),
        .carry_out(carry_out)
        );
        
        initial
        
            begin
                
        a=0;b=0;c=0;
        #25;
        
        c=1;
        #25;
        
        b=1;c=0;
        #25;
        
        c=1;
        #25;
        
        a=1;b=0;c=0;
        #25;
        
        c=1;
        #25;
        
        b=1;c=0;
        #25;
        
        c=1;
        #25;
        
        $finish;
       end
 

endmodule
    

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2026 21:03:49
// Design Name: 
// Module Name: half_adder 1
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


module half_adder(a,b,sum,carry);
    
    input a;
    input b;
    output sum;
    output carry;
    
    xor g0(sum,a,b);
    and g1(carry,a,b);
   
endmodule

module testbench;
    
    reg a;
    reg b;
    wire sum;
    wire carry;
    
    half_adder uut(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
        );
        
        initial
            begin
                
                a=0;b=0;
                #25;
                
                b=1;
                #25;
                
                a=1;b=0;
                #25;
                
                b=1;
                #25;
                
                $finish;
            end

endmodule
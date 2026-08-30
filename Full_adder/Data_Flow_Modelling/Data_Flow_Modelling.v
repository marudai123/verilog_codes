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


module full_adder(a,b,carry_in,carry_out,sum);
    
    input a;
    input b;
    input carry_in;
    output  sum;
    output  carry_out;
    
    assign sum = a^b^carry_in;
    assign carry_out = (a&b)|(carry_in & (a^b));
   
endmodule


module testbench;

    reg a;
    reg b;
    reg c;
    wire sum;
    wire carry_out;
    
    full_adder dut (
        .a(a),
        .b(b),
        .carry_in(c),
        .sum(sum),
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
    
    

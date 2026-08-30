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
    
    wire t1,t2,t3;
    xor g0 (t1,a,b);
    xor g1 (sum,carry_in,t1);
    and g2 (t2,carry_in,t1);
    and g3 (t3,a,b);
    or  g4 (carry_out,t2,t3);   
   
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
    
    

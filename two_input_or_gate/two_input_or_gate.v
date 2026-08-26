`timescale 1s / 100ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2026 15:07:49
// Design Name: 
// Module Name: two_input_or_gate
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


module two_input_or_gate(a,b,y );
    
    input a;
    input b;
    output y;
    
    assign y = a|b;
    
endmodule

module testbench;
    
    reg a;
    reg b;
    wire y;
    
    two_input_or_gate uut(
    .a(a),
    .b(b),
    .y(y)
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

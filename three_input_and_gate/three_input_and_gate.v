`timescale 1s / 100ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2026 14:13:11
// Design Name: 
// Module Name: two_input_and_gate
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

module three_input_and_gate(a,b,c,y);

    input a;
    input b;
    input c;
    
    output y;
    
    assign y = a & b & c;
    
 endmodule
 
module testbench;
    
    reg a;
    reg b;
    reg c;
    wire y;
    
    three_input_and_gate uut ( 
    .a(a),
    .b(b),
    .c(c),
    .y(y)
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
     
`timescale 1s / 100ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2026 15:32:16
// Design Name: 
// Module Name: not_gate
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


module not_gate(a,y);

    input a;
    output y;
    
    assign y = ~a;
    
endmodule

module testbench_;
     reg a;
     wire y;
     
     not_gate uut(
     .a(a),
     .y(y)
     );
      initial
      
       begin
        
         a=0;
         #25;
         
         a=1;
         #25; 
         
         $finish;
         
       end
         
 endmodule
         
   
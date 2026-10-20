`timescale 1ns / 1ps



module mux_2to1(
    
    input [1:0] a,
    input s ,
    output y
   );
 
  assign  y = s ? a[1]:a[0];
  
endmodule

`timescale 1ns / 1ps

module mux_2to1_tb;

   
    reg [1:0] a;
    reg s;
    wire y;

  
    mux_2to1 dut (
        .a(a),
        .s(s),
        .y(y)
    );


    initial
    begin
        a = 2'b00;
        s = 1'b0;
        #10;
        
        a = 2'b00; 
        s = 1'b1; 
        #10;

        a = 2'b01; 
        s = 1'b0; 
        #10;
        
        a = 2'b01; 
        s = 1'b1; 
        #10;

        a = 2'b10; 
        s = 1'b0; 
        #10;
        
        a = 2'b10; 
        s = 1'b1; 
        #10;

        a = 2'b11; 
        s = 1'b0; 
        #10;
        
        a = 2'b11; 
        s = 1'b1; 
        #10;

        $finish;
    end

   
    initial
    begin
        $monitor("Time=%0t | A=%b | S=%b | Y=%b",
                 $time, a, s, y);
    end

endmodule
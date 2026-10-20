`timescale 1ns / 1ps


module mux_2to1_using_not ( 
    
    input  A,
    input s,
    output y
    );
    
    assign y = A ? 1'b0 : 1'b1;
    
 endmodule 
    
    
  

module mux_2to1_using_not_tb;

    reg A;
    reg s;
    wire y;

    
    mux_2to1_using_not dut (
        .A(A),
        .s(s),
        .y(y)
    );

    initial
    begin
        A = 1'b0; 
        s = 1'b0; 
        #10;
        A = 1'b0; 
        s = 1'b1; 
        #10;
        A = 1'b1; 
        s = 1'b0; 
        #10;
        A = 1'b1; 
        s = 1'b1; 
        #10;

        $finish;
    end

   
    initial
    begin
        $monitor("Time=%0t | A=%b | S=%b | Y=%b",
                 $time, A, s, y);
    end

endmodule


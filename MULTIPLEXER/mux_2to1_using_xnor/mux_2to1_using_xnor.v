`timescale 1ns / 1ps

module mux_2to1_using_xnor( 
    
    input  B,
    input A, 
    output y
    );
    
    assign y = A ?  B: ~B;
    
 endmodule 
  

module mux_2to1_using_xnor_tb;

    reg A;
    reg B;
    wire y;

    
    mux_2to1_using_xnor dut (
        .A(A),
        .B(B),
        .y(y)
    );

    initial
    begin
        A = 1'b0; 
        B = 1'b0; 
        #10;
        A = 1'b0; 
        B = 1'b1; 
        #10;
        A = 1'b1; 
        B = 1'b0; 
        #10;
        A = 1'b1; 
        B = 1'b1; 
        #10;

        $finish;  
    end

    
    initial
    begin
        $monitor("Time=%0t | A=%b | B=%b | Y=%b",
                 $time, A, B, y);
    end

endmodule
    
`timescale 1ns / 1ps


module full_subtractor (a,b,borrow_in,difference,borrow_out);
    
    input a;
    input b;
    input borrow_in;
    output  difference;
    output  borrow_out;
    wire t1,t2,t3,t4,t5,t6;
    
    xor g1 (t1,a,b);
    xor g2 (difference,t1,borrow_in);
    not g3 (t3,a);
    and g4 (t4,t3,b);
    not g5 (t5,t1);
    and g6 (t6,borrow_in,t5);
    or  g7 (borrow_out,t6,t4);
    
   
endmodule


module Four_bit_Subtractor(
    input [3:0] a,
    input [3:0] b,
    input  bin,
    output [3:0] difference,
    output borrow_out
    );
    wire [3:0] d;
    wire [3:0] bout;
    
     full_subtractor fs0 (a[0],b[0],bin,d[0],bout[0]);
     full_subtractor fs1 (a[1],b[1],bout[0],d[1],bout[1]);
     full_subtractor fs2 (a[2],b[2],bout[1],d[2],bout[2]);
     full_subtractor fs3 (a[3],b[3],bout[2],d[3],bout[3]);
     
      assign difference = d;
      assign borrow_out = bout[3]; 
endmodule

module Four_bit_Subtractor_tb;

    reg [3:0] a;
    reg [3:0] b;
    reg bin;

    wire [3:0] difference;
    wire borrow_out;

    
    Four_bit_Subtractor dut(
        .a(a),
        .b(b),
        .bin(bin),
        .difference(difference),
        .borrow_out(borrow_out)
    );

    initial
    begin

        
        a = 4'b0000;
        b = 4'b0000;
        bin = 1'b0;
        #10;

        
        a = 4'b0101;
        b = 4'b0011;
        bin = 1'b0;
        #10;

        
        a = 4'b1000;
        b = 4'b0011;
        bin = 1'b0;
        #10;

        
        a = 4'b0011;
        b = 4'b0101;
        bin = 1'b0;
        #10;

        
        a = 4'b1111;
        b = 4'b0001;
        bin = 1'b0;
        #10;

        
        a = 4'b1010;
        b = 4'b0101;
        bin = 1'b1;
        #10;

        
        a = 4'b0000;
        b = 4'b0001;
        bin = 1'b0;
        #10;

        
        a = 4'b1111;
        b = 4'b1111;
        bin = 1'b1;
        #10;

        $finish;
    end

    initial
    begin
        $monitor("Time=%0t | A=%b | B=%b | Bin=%b | Difference=%b | Borrow_out=%b",
                 $time, a, b, bin, difference, borrow_out);
    end

endmodule

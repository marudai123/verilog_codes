`timescale 1ns / 1ps

module CLA(a, b, s, Cout);

    input [3:0] a;
    input [3:0] b;

    output [3:0] s;
    output Cout;

    wire [3:0] p;
    wire [3:0] g;
    wire c0,c1,c2,c3,c4;

    //  Carry Generation
    assign g = a & b;

    //  Carry Propagation 
    assign p = a ^ b;

    // Carry of CLA
    assign c0 = 1'b0;
    assign c1 = g[0] | (p[0] & c0);
    assign c2 = g[1] | (p[1] & (g[0] | p[0] & c0));
    assign c3 = g[2] | (p[2] & (g[1] | p[1] & (g[0] | p[0] & c0)));
    assign c4 = g[3] | (p[3] & (g[2] | p[2] & (g[1] | p[1] & (g[0] | p[0] & c0))));

    assign Cout = c4;

    // Sum
    assign s = p ^ {c3,c2,c1,c0};

endmodule



module CLA_tb;
    
    // port declaration 
    reg [3:0] a;
    reg [3:0] b;

    wire [3:0] s;
    wire Cout;
    
     // Instantiate DUT
    CLA uut (
        .a(a),
        .b(b),
        .s(s),
        .Cout(Cout)
    );
     
     // test cases
    initial
    begin

        a = 4'b0000;
        b = 4'b0000;
        #10;

        a = 4'b0001;
        b = 4'b0010;
        #10;

        a = 4'b0011;
        b = 4'b0011;
        #10;

        a = 4'b0101;
        b = 4'b0011;
        #10;

        a = 4'b0111;
        b = 4'b0001;
        #10;

        a = 4'b1111;
        b = 4'b0001;
        #10;

        a = 4'b1111;
        b = 4'b1111;
        #10;

        $finish;
    end
  // displaying output 
    initial
    begin
        $monitor("Time=%0t | A=%b | B=%b | S=%b | Cout=%b",
                  $time, a, b, s, Cout);
    end

endmodule
`timescale 1ns / 1ps



module Half_Subtractor(a,b,difference,borrow);
    
    //Port declaration 
    input a;
    input b;
    
    output  difference;
    output  borrow;
    wire t1;
    
    //gate_level
    xor g0 (difference,a,b);
    not g1 (t1,a);
    and g2 (borrow,t1,b);
    
endmodule


`timescale 1ns / 1ps

module Half_Subtractor_tb;

    // Testbench signals
    reg a;
    reg b;

    wire difference;
    wire borrow;

    // Instantiate DUT
    Half_Subtractor uut (
        .a(a),
        .b(b),
        .difference(difference),
        .borrow(borrow)
    );

    // Test cases
    initial
    begin

        a = 1'b0;
        b = 1'b0;
        #10;

        a = 1'b0;
        b = 1'b1;
        #10;

        a = 1'b1;
        b = 1'b0;
        #10;

        a = 1'b1;
        b = 1'b1;
        #10;

        $finish;

    end

    // Display output
    initial
    begin
        $monitor("Time=%0t | A=%b | B=%b | Difference=%b | Borrow=%b",
                  $time, a, b, difference, borrow);
    end

endmodule



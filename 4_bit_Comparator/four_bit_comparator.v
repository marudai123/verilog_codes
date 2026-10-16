`timescale 1ns / 1ps



module four_bit_comparator(
    //port declarations 
    input [3:0] a,
    input [3:0] b,
    output a_eq_b,
    output a_gt_b,
    output a_lt_b

    );
    
    /*case 1 A=B
    a[3]=b[3]
    a[2]=b[2]
    a[1]=b[1]
    a[0]=b[0] 
    */
    
    assign a_eq_b = ~(a[3]^b[3])&~(a[2]^b[2])&~(a[1]^b[1])&~(a[0]^b[0]);
    
    /*  case 2 if A>B 
    a[3]>b[3] or 
    if a[3]=b[3] and a[2]>b[2] or 
    if a[3]=b[3] and a[2]=b[2] and a[1]>b[1] or
    if a[3]=b[3] and a[2]=b[2] and a[1]=b[1] and a[0]>b[0]
    */
    
    assign a_gt_b = a[3]&~b[3]|~(a[3]^b[3])&(a[2]&~b[2])|
                    ~(a[3]^b[3])&~(a[2]^b[2])&(a[1]&~b[1])|
                    ~(a[3]^b[3])&~(a[2]^b[2])&~(a[1]^b[1])&(a[0]&~b[0]);
                    
   /* case 3 if A<B
   a[3]<b[3] or
    if a[3]=b[3] and a[2]<b[2] or 
    if a[3]=b[3] and a[2]=b[2] and a[1]<b[1] or
    if a[3]=b[3] and a[2]=b[2] and a[1]=b[1] and a[0]<b[0] 
    */
    
    assign a_lt_b = ~a[3]&b[3]|~(a[3]^b[3])&(~a[2]&b[2])|
                    ~(a[3]^b[3])&~(a[2]^b[2])&(~a[1]&b[1])|
                    ~(a[3]^b[3])&~(a[2]^b[2])&~(a[1]^b[1])&(~a[0]&b[0]);
  
endmodule


module four_bit_comparator_tb;

    reg [3:0] a, b;
    wire a_eq_b, a_gt_b, a_lt_b;

    // DUT instantiation
    four_bit_comparator dut (
        .a(a),
        .b(b),
        .a_eq_b(a_eq_b),
        .a_gt_b(a_gt_b),
        .a_lt_b(a_lt_b)
    );

    initial
    begin
        // Case 1: A = B
        a = 4'b0000; b = 4'b0000;
        #10;
        a = 4'b1111; b = 4'b1111;
        #10;

        // Case 2: A > B
        a = 4'b1000; b = 4'b0111;
        #10;
        a = 4'b0100; b = 4'b0011;
        #10;
        a = 4'b0010; b = 4'b0001;
        #10;
        a = 4'b0001; b = 4'b0000;
        #10;

        // Case 3: A < B
        a = 4'b0111; b = 4'b1000;
        #10;
        a = 4'b0011; b = 4'b0100;
        #10;
        a = 4'b0000; b = 4'b1111;
        #10;

        $finish;
    end

    // Display results
    initial
    begin
        $monitor("Time=%0t | A=%b | B=%b | EQ=%b | GT=%b | LT=%b",
                 $time, a, b, a_eq_b, a_gt_b, a_lt_b);
    end

endmodule

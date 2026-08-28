`timescale 1s / 100ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2026 19:55:34
// Design Name: 
// Module Name: half_adder
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

module half_adder(a, b, sum, carry);

    input a;
    input b;
    output reg sum;
    output reg carry;

    reg [1:0] result;

    always @(*) begin
        result = a + b;
        sum = result[0];
        carry = result[1];
    end

endmodule


module testbench;

    reg a;
    reg b;
    wire sum;
    wire carry;

    half_adder uut(
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin

        a = 0; b = 0;
        #25;

        b = 1;
        #25;

        a = 1; b = 0;
        #25;

        b = 1;
        #25;

        $finish;

    end

endmodule

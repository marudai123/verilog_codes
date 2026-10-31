`timescale 1ns / 1ps


module demux_1to4 (
    input   d_in,
    input  [1:0]s,
    output reg [3:0]y
     );
     
    always@(*)
        begin
            y = 4'b0000;
            case(s)
            
            2'b00  : y[0]=d_in;
            2'b01  : y[1]=d_in;
            2'b10  : y[2]=d_in;
            2'b11  : y[3]=d_in;
            default: y = 4'b0000;
            
            endcase
        end
endmodule




module demux_1to4_tb;

   
    reg d_in;
    reg [1:0] s;
    wire [3:0] y;

    
    demux_1to4 dut (
        .d_in(d_in),
        .s(s),
        .y(y)
    );

  
    initial
    begin
  
        d_in = 1'b1;

        s = 2'b00; #10;
        s = 2'b01; #10;
        s = 2'b10; #10;
        s = 2'b11; #10;

      
        d_in = 1'b0;

        s = 2'b00; #10;
        s = 2'b01; #10;
        s = 2'b10; #10;
        s = 2'b11; #10;

        $finish;
    end

    
    initial
    begin
        $monitor("Time=%0t | D_IN=%b | S=%b | Y=%b",
                 $time, d_in, s, y);
    end

endmodule
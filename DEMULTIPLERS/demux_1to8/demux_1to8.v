`timescale 1ns / 1ps


module demux_1to8 (
    input   d_in,
    input  [2:0]s,
    output reg [7:0]y
     );
     
    always@(*)
        begin
            y = 8'b00000000;
            case(s)
            
            3'b000 : y[0]=d_in;
            3'b001 : y[1]=d_in;
            3'b010 : y[2]=d_in;
            3'b011 : y[3]=d_in;
            3'b100 : y[4]=d_in;
            3'b101 : y[5]=d_in;
            3'b110 : y[6]=d_in;
            3'b111 : y[7]=d_in;
            default: y = 8'b00000000;
            
            endcase
        end
endmodule




module demux_1to8_tb;

   
    reg d_in;
    reg [2:0] s;
    wire [7:0] y;

    
    demux_1to8 dut (
        .d_in(d_in),
        .s(s),
        .y(y)
    );

  
    initial
    begin
  
        d_in = 1'b1;

        s = 3'b000; #10;
        s = 3'b001; #10;
        s = 3'b010; #10;
        s = 3'b011; #10;
        s = 3'b100; #10;
        s = 3'b101; #10;
        s = 3'b110; #10;
        s = 3'b111; #10;

      
        d_in = 1'b0;

        s = 3'b000; #10;
        s = 3'b001; #10;
        s = 3'b010; #10;
        s = 3'b011; #10;
        s = 3'b100; #10;
        s = 3'b101; #10;
        s = 3'b110; #10;
        s = 3'b111; #10;

        $finish;
    end

    
    initial
    begin
        $monitor("Time=%0t | D_IN=%b | S=%b | Y=%b",
                 $time, d_in, s, y);
    end

endmodule
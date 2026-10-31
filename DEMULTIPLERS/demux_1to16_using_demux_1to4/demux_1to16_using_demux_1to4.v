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


module demux_1to16(
     input d_in,
    input  [3:0]s,
    output [15:0]y

    );
    wire [3:0] t;
    
    demux_1to4 bo(d_in,s[3:2],t[3:0]);
    demux_1to4 b1(t[0],s[1:0],y[3:0]);
    demux_1to4 b2(t[1],s[1:0],y[7:4]);
    demux_1to4 b3(t[2],s[1:0],y[11:8]);
    demux_1to4 b4(t[3],s[1:0],y[15:12]);
    
  
endmodule



module demux_1to16_tb;

  
    reg d_in;
    reg [3:0] s;

    wire [15:0] y;

   
    demux_1to16 dut (
        .d_in(d_in),
        .s(s),
        .y(y)
    );

 
    initial
    begin

       
        d_in = 1'b1;

        s = 4'b0000; #10;
        s = 4'b0001; #10;
        s = 4'b0010; #10;
        s = 4'b0011; #10;

        s = 4'b0100; #10;
        s = 4'b0101; #10;
        s = 4'b0110; #10;
        s = 4'b0111; #10;

        s = 4'b1000; #10;
        s = 4'b1001; #10;
        s = 4'b1010; #10;
        s = 4'b1011; #10;

        s = 4'b1100; #10;
        s = 4'b1101; #10;
        s = 4'b1110; #10;
        s = 4'b1111; #10;

       
        d_in = 1'b0;

        s = 4'b0000; #10;
        s = 4'b0101; #10;
        s = 4'b1010; #10;
        s = 4'b1111; #10;

        $finish;
    end

   
    initial
    begin
        $monitor("Time=%0t | D_IN=%b | S=%b | Y=%016b",
                 $time, d_in, s, y);
    end

endmodule

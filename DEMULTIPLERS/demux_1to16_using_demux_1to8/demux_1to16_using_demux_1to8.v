`timescale 1ns / 1ps

module demux_2to1(
    input d_in,
    input s,
    output reg [1:0]  y
    );
    
  always@(*) 
  begin
        y = 2'b00;

        if (s == 1'b0)
            y[0] = d_in;
        else
            y[1] = d_in;
    end

  endmodule 
  
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

module demux_1to16(
     input d_in,
    input  [3:0]s,
    output [15:0]y

    );
    wire [1:0] t;
    demux_2to1 bo (d_in,s[3],t[1:0]);
    demux_1to8 b1 (t[0],s[2:0],y[7:0]);
    demux_1to8 b2 (t[1],s[2:0],y[15:8]);
      
    
    
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

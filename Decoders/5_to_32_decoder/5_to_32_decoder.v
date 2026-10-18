`timescale 1ns / 1ps



module  decoder_3to8(
    
    input [2:0] a,
    input en,
    output reg [7:0] y
    );
    
    always@(*)
        begin
            y = 8'b00000000;
                if(en)
                    begin
                        case(a)
                        
                        3'b000 : y =  8'b00000001;
                        3'b001 : y =  8'b00000010;
                        3'b010 : y =  8'b00000100;
                        3'b011 : y =  8'b00001000;
                        3'b100 : y =  8'b00010000;
                        3'b101 : y =  8'b00100000;
                        3'b110 : y =  8'b01000000;
                        3'b111 : y =  8'b10000000;
                       default : y =  8'b00000000; 
                        
                        endcase
                    end
                
                else
                
                    y = 8'b00000000; 
                     
        end
                                                
    
endmodule


module decoder_2to4(
    input [1:0] a,
    input en,
    output reg [3:0] y
);

    always @(*) 
     begin
        y = 4'b0000;

        if (en)
         begin
            case (a)
                2'b00: y = 4'b0001;
                2'b01: y = 4'b0010;
                2'b10: y = 4'b0100;
                2'b11: y = 4'b1000;
            endcase
        end
    end

endmodule


module decoder_5to32(

    input [4:0] a,
    input  en,
    output reg [31:0] y
    
    );
 
    wire [3:0] d;
    wire [31:0] y1;
    
    
    decoder_2to4 b0 (a[4:3],en,d);
    decoder_3to8 b1 (a[2:0],d[0],y1[7:0]);
    decoder_3to8 b2 (a[2:0],d[1],y1[15:8]);
    decoder_3to8 b3 (a[2:0],d[2],y1[23:16]);
    decoder_3to8 b4 (a[2:0],d[3],y1[31:24]);
    
  
    
   always @(*)
begin
    if (en == 1'b0)
        y = {32{1'b0}};
    else
        y = y1;
end
  
  endmodule
  
  
  `timescale 1ns / 1ps

module decoder_5to32_tb;

    reg [4:0] a;
    reg en;
    wire [31:0] y;

    // DUT instantiation
    decoder_5to32 dut (
        .a(a),
        .en(en),
        .y(y)
    );

    initial
    begin
        en = 1'b1;

        
        a = 5'b00000;
        #10;
        a = 5'b00111; 
        #10;

        a = 5'b01000; 
        #10;
        a = 5'b01111; 
        #10;

        a = 5'b10000; 
        #10;
        a = 5'b10101; 
        #10;
        
        a = 5'b10111; 
        #10;

      
        a = 5'b11000;
        #10;
        a = 5'b11111; 
        #10;

        
        en = 1'b0;
        a = 5'b10101;
        #10;
        
        a = 5'b10001;
        #10;

        $finish;
    end

    initial
    begin
        $monitor("Time=%0t | EN=%b | A=%b | Y=%032b",
                 $time, en, a, y);
    end

endmodule 
    
    


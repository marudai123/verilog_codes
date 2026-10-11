`timescale 1ns / 1ps

module top_parity_system(
    input [2:0] data_in,
    input  mode,
    input [3:0] error_mask,
    output  reg valid
     );
     
     reg parity_bit;
     reg [3:0] transmitted_data;
     reg [3:0] received_data;
    
     
     //parity Generator
     always@(*)
     begin
     //even parity generator
      if (mode)
     parity_bit = ^data_in;
     //odd parity generator
     else 
     parity_bit =~(^data_in);   
     
     end
     
     //transmitted_data
    always @(*)
begin
    transmitted_data = {data_in, parity_bit};
end


     //received_data
    always @(*)
begin
    received_data = transmitted_data ^ error_mask;
end
 
     
     //parity checker 
     always@(*)
     begin
     //even parity checker 
     if(mode)
     valid = ~(^received_data);
     //odd parity checker
     else
     valid = ^received_data;
     end

endmodule


`timescale 1ns / 1ps

module top_parity_system_tb;

    reg [2:0] data_in;
    reg mode;
    reg [3:0] error_mask;

    wire valid;

    // DUT instantiation
    top_parity_system dut (
        .data_in(data_in),
        .mode(mode),
        .error_mask(error_mask),
        .valid(valid)
    );

    initial
    begin
        // EVEN PARITY: mode = 1
        data_in = 3'b101;
        mode = 1'b1;

        error_mask = 4'b0000; #10; 
        error_mask = 4'b0001; #10; 
        error_mask = 4'b0010; #10; 
        error_mask = 4'b0100; #10; 
        error_mask = 4'b1000; #10; 

        // ODD PARITY: mode = 0
        data_in = 3'b101;
        mode = 1'b0;

        error_mask = 4'b0000; #10; 
        error_mask = 4'b0001; #10; 
        error_mask = 4'b0010; #10; 
        error_mask = 4'b0100; #10; 
        error_mask = 4'b1000; #10; 

        $finish;
    end

    initial
    begin
        $monitor("Time=%0t | Mode=%b | Data=%b | Mask=%b | TX=%b | RX=%b | Valid=%b",
                 $time, mode, data_in, error_mask,
                 dut.transmitted_data, dut.received_data, valid);
    end

endmodule
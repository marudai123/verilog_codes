module full_subtractor (a,b,borrow_in,difference,borrow_out);
    
    input a;
    input b;
    input borrow_in;
    output  difference;
    output  borrow_out;
    
   assign difference = a^b^borrow_in;
   assign borrow_out = (~a&b|borrow_in&(~(a^b)));
   
     
endmodule

module full_subtractor_tb;
    
    //port declaration 
    reg a;
    reg b; 
    reg bin;
    wire difference;
    wire borrow_out;
    
    full_subtractor dut(
      .a(a),
      .b(b),
      .borrow_in(bin),
      .difference(difference),
      .borrow_out(borrow_out)
      );
      
initial
begin 
         
    a = 1'b0; b = 1'b0; bin = 1'b0;
    #10;

    a = 1'b0; b = 1'b0; bin = 1'b1;
    #10;

    a = 1'b0; b = 1'b1; bin = 1'b0;
    #10;

    a = 1'b0; b = 1'b1; bin = 1'b1;
    #10;

    a = 1'b1; b = 1'b0; bin = 1'b0;
    #10;

    a = 1'b1; b = 1'b0; bin = 1'b1;
    #10;

    a = 1'b1; b = 1'b1; bin = 1'b0;
    #10;

    a = 1'b1; b = 1'b1; bin = 1'b1;
    #10;
    
    $finish;
   end
   initial 
   begin 
   $monitor("Time = %0t|A = %b|B = %b |Borrow_in = %b |Difference = %b| Borrow_out = %b", 
              $time,a,b,bin,difference,borrow_out);
   end 
   
endmodule 
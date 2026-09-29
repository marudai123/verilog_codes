
module Half_Subtractor(a,b,difference,borrow);
    
  
    input a;
    input b;
    
    output  difference;
    output  borrow;
    wire t4;
    
   
    xor g0 (difference,a,b);
    not g1 (t4,a);
    and g2 (borrow,t4,b);
    
endmodule

module full_subtractor (a,b,borrow_in,difference,borrow_out);
    
    input a;
    input b;
    input borrow_in;
    output  difference;
    output  borrow_out;
    wire t1,t2,t3;
   
     Half_Subtractor hs0(a,b,t2,t1);
     Half_Subtractor hs1(t2,borrow_in,difference ,t3);
     or g3 (borrow_out,t3,t1);
   
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
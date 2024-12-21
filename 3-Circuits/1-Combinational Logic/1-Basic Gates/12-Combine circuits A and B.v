// * Mt2015 q4 *
// -----------------------------------------------------

module top_module (input x, input y, output z);
    
    wire z0, z1, z2, z3;
    
    A IA1(.x(x), .y(y), .z(z0));
    
    B IB1(.x(x), .y(y), .z(z1));
    
    A IA2(.x(x), .y(y), .z(z2));
    
    B IB2(.x(x), .y(y), .z(z3));    
    
    assign z = (z0 | z1) ^ (z2 & z3);

endmodule

module B ( input x, input y, output z );

    assign z = !(x ^ y);  
 
endmodule

module A (input x, input y, output z);

    assign z = (x^y) & x;  
    
endmodule

module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    //First Solution
    /*
    assign p1y = (p1a& p1c & p1b) | (p1f & p1e & p1d);  
    assign p2y = (p2c & p2d) | (p2a & p2b);
  	*/
    
    //Second Solution
    /*
    wire and31, and32, and21, and22;
    
    assign and31 = p1a& p1c & p1b;
    assign and32 = p1f & p1e & p1d;
    assign p1y = and31 | and32;
    
    assign and21 = p2c & p2d; 
    assign and22 = p2a & p2b;
	assign p2y = and21 | and22;
    */
    
endmodule

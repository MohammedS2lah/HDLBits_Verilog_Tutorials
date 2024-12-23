// * Exams/ece241 2014 q3 *
// -----------------------------------------------------

module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    
    assign mux_in = {{(c & d)}, {!d}, {1'b0} , {c | d}};
    /*
    assign mux_in[3] = (c)? d: 1'b0;
    
    assign mux_in[2] = (d)? 1'b0: 1'b1;
    
    assign mux_in[1] = 1'b0;
    
    assign mux_in[0] = (c)? 1'b1: d;
 	*/  
        
endmodule

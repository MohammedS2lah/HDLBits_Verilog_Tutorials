// * Exams/m2014 q6c *
// -----------------------------------------------------

module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);

    
    parameter A=1, B=2, C=3, D=4, E=5, F=6;
    reg [6:1] next_state; 
    
    // State transition logic
    assign next_state[A] = (y[A] & w) | (y[D] & w);
    assign next_state[B] = (y[A] & ~w);
    assign next_state[C] = (y[B] & ~w) | (y[F] & ~w);
    assign next_state[D] = (y[B] & w) | (y[C] & w) | (y[E] & w) | (y[F] & w);
    assign next_state[E] = (y[E] & ~w) | (y[C] & ~w);
    assign next_state[F] = (y[D] & ~w);    

    // Output logic: 
    assign Y2 = next_state[2]; 
    assign Y4 = next_state[4]; 
    
    /*
    //Another Solution
    assign Y2 = (y[1] & ~w) ; 
    assign Y4 = ((y[2] & w) | (y[3] & w) | (y[5] & w) | (y[6] & w));  
    */
    
endmodule

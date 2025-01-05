// * Exams/2012 q2b *
// -----------------------------------------------------

module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);

    
    parameter A=0, B=1, C=2, D=3, E=4, F=5;
    reg [5:0] next_state; 
    
    // State transition logic
    assign next_state[A] = (y[A] & ~w) | (y[D] & ~w);
    assign next_state[B] = (y[A] & w);
    assign next_state[C] = (y[B] & w) | (y[F] & w);
    assign next_state[D] = (y[B] & ~w) | (y[C] & ~w) | (y[E] & ~w) | (y[F] & ~w);
    assign next_state[E] = (y[E] & w) | (y[C] & w);
    assign next_state[F] = (y[D] & w);    

    // Output logic: 
    assign Y1 = next_state[1]; 
    assign Y3 = next_state[3]; 
    
    /*
    //Another Solution
    assign Y1 = (y[0] & w) ; 
    assign Y3 = ((y[1] & ~w) | (y[2] & ~w) | (y[4] & ~w) | (y[5] & ~w));  
    */
    
endmodule

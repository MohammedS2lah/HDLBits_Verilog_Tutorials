// * Sim/circuit8 *
// -----------------------------------------------------

module top_module (
    input clock,
    input a,
    output p,
    output q );
    
    always @(*)
        begin
            if(clock) p = a;
        end
    
    always @(negedge clock) q <= p;

endmodule

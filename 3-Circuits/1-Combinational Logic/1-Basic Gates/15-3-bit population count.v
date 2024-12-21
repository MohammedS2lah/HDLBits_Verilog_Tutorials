// * Popcount3 *
// -----------------------------------------------------

module top_module( 
    input [2:0] in,
    output [1:0] out );

    reg [1:0] counter;
    
    integer i;
    
    always @(*)
        begin
            counter = 0;
            for (i=0; i<$bits(in); i++)
                begin
                    if(in[i]) counter = counter +1'b1;
                end
            out = counter;
        end
    
endmodule

// * Gatesv100 *
// -----------------------------------------------------

module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    
    assign out_both = in & in[99:1];
    
    assign out_any = in | in[99:1];
    
    assign out_different = in ^ ({ in[0], in[99:1]});
    
    /*
    integer i;
    
    always @(*)
        begin
            for (i = 1; i<$bits(in); i++)
                begin
                    out_both[i-1] = in[i-1] & in[i];
                    
                    out_any[i] = in[i-1] | in[i];
                    
                    out_different[i-1] = in[i-1] ^ in[i];
                end
            out_different[99] = in[99] ^ in[0];
        end 
*/
endmodule

// * Mux256to1 *
// -----------------------------------------------------

module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    
    assign out = in[sel];
    
    /*
    reg out_reg;
    
    integer i;
    
    always @(*)
        begin
            out_reg = 0;
            for(i=0; i<$bits(in); i++)
                begin
                    if(sel == i) out_reg = in[i];
                end
    		out = out_reg;
        end
	*/
endmodule

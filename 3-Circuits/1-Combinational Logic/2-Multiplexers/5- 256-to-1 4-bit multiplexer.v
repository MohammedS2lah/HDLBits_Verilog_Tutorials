// * Mux256to1v *
// -----------------------------------------------------

module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

    			 //[LSB+:width]
    assign out = in[sel*4+:4];
    
    //assign out = {{in[sel*4+3]}, {in[sel*4+2]}, {in[sel*4+1]}, {in[sel*4+0]}};
   /* 
    reg [3:0] out_reg;
    integer i;
    always@(*)
        begin
            out_reg = 0;
            for (i=0 ; i<$bits(in); i++)
                begin
                    if(sel == i) 
                        begin
                            out_reg = {{in[i*4+3]}, {in[i*4+2]}, {in[i*4+1]}, {in[i*4]}};
                        end
                end
    		out = out_reg;   
        end
*/
    /*
    reg [3:0] out_reg;
    integer i;
    always@(*)
        begin
            out_reg = 0;
            for (i=0 ; i<$bits(in); i++)
                begin
                    out_reg = {{in[sel*4+3]}, {in[sel*4+2]}, {in[sel*4+1]}, {in[sel*4]}};
                end
    		out = out_reg;   
        end    
    */
    
endmodule

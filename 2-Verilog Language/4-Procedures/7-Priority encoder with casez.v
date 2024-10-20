//*Always casez*
//-----------------------------------------------------
module top_module (
    input [7:0] in,
    output reg [2:0] pos );
    
    always @ (*)
        begin
            casez (in)
                8'bzzzz_zzz1: pos = 0;
                8'bzzzz_zz10: pos = 1;
                8'bzzzz_z100: pos = 2;
                8'bzzzz_1000: pos = 3;            
                8'bzzz1_0000: pos = 4;
                8'bzz10_0000: pos = 5;
                8'bz100_0000: pos = 6;
                8'b1000_0000: pos = 7;  
                default: pos = 0;
            endcase
        end

endmodule

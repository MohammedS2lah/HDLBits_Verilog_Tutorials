//*Always case2*
//-----------------------------------------------------
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    
    
    always @ (*)
        begin
            casex (in)
                4'bxxx1: pos = 2'b00;
                4'bxx10: pos = 2'b01;
                4'bx100: pos = 2'b10;
                4'b1000: pos = 2'b11;            
            	default: pos = 2'b00;
            endcase
        end
	 
    /*
    always @ (*)
        begin
            case (in)
                4'h0: pos = 2'b00;	//0000
                4'h1: pos = 2'b00;	//0001
                4'h2: pos = 2'b01;	//0010
                4'h3: pos = 2'b00; 	//0011
                4'h4: pos = 2'b10;	//0100
                4'h5: pos = 2'b00;	//0101
                4'h6: pos = 2'b01;	//0110
                4'h7: pos = 2'b00;  //0111          
                4'h8: pos = 2'b11;	//1000
                4'h9: pos = 2'b00;	//1001
                4'ha: pos = 2'b01;	//1010
                4'hb: pos = 2'b00; 	//1011
                4'hc: pos = 2'b10;	//1100
                4'hd: pos = 2'b00;	//1101
                4'he: pos = 2'b01;	//1110
                4'hf: pos = 2'b00; 	//1111
                default: pos = 2'b00;
            endcase
        end    
      */
endmodule

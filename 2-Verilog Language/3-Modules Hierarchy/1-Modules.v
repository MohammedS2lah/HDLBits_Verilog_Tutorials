//*Module*
//-----------------------------------------------------
module top_module ( input a, input b, output out );
    //By position
    //mod_a inst ( a, b, out );
    
    //By name
    mod_a inst ( .in1(a), .in2(b), .out(out) );
endmodule

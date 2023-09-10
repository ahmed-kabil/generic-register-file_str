module generic_decoder  
#(parameter D = 20)(
input [$clog2(D)-1 : 0]selectors ,
input enable ,
output reg [D - 1 : 0]Q
);
  
integer k ;
  
always@(*)
  begin
    if (~enable)
      Q = 'b0  ;
    else
      begin
        Q = 'b0  ; 
        for(k = 0 ; k < D ; k = k+1)  
          begin
            if (k == selectors)
              Q [k] = 1'b1  ;
            else 
              Q = Q  ; 
          end 
      end
  end
endmodule

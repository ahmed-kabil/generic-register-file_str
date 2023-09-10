module memory_cell (               
input clk ,
input reset_n ,
input select ,
input write ,
input read ,
input in_data ,
output reg out_data ,
output storage
);

reg  D_stored  ;

always @ (posedge clk , negedge reset_n)
begin
  if (~reset_n)
     begin
       D_stored <= 1'bx  ;
       out_data <= 1'bx  ;
     end
     
  else if (select)
    begin
      case ({read , write})
        2'b00 :  
          begin
             D_stored <= D_stored ;
             out_data <= 1'bx ;
          end

        2'b01 :  
          begin
             D_stored <= in_data ;
             out_data <= 1'bx ;
          end

        2'b10 :  
          begin
             D_stored <= D_stored ;
             out_data <= D_stored ;
          end

        2'b11 :  
          begin
             D_stored <= in_data ;
             out_data <= D_stored ;
          end

        default : 
          begin
             D_stored <= D_stored ;
             out_data <= 1'bx ;
          end

      endcase
    end

  else 
    begin
     D_stored <= D_stored ;
     out_data <= 1'bx ;
    end
end

assign storage = D_stored ;

endmodule

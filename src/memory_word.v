module memory_word          
#(parameter R = 8) (
input clk ,
input reset_n ,
input select ,
input write ,
input read ,
input [R-1 : 0]in_data ,
output [R-1 : 0]out_data,
output [R-1 : 0]storage
);


generate
genvar k ;

   for (k = 0 ; k < R ; k = k+1)
     begin 
       memory_cell cell1 (
          .clk(clk),
          .reset_n(reset_n),
          .select(select),
          .write(write),
          .read(read),
          .in_data(in_data[k]),
          .out_data(out_data[k]),
          .storage(storage[k])
       );
     end
endgenerate

endmodule

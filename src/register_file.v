module register_file                 
#(parameter word_width = 32 , length = 128) (
input clk ,
input reset_n ,
input [$clog2(length)-1 : 0]write_addres ,
input [$clog2(length)-1 : 0]read_addres ,
input write ,
input read ,
input [word_width-1 : 0]in_data ,
output [word_width-1 : 0]out_data 
);

wire [word_width-1 : 0] storage [0 : length-1] ;

wire [length - 1 : 0]dec_wri_Q ;
generic_decoder #(.D(length)) writeDecoder (
  .selectors(write_addres),
  .enable(write),
  .Q(dec_wri_Q)
);

wire [length - 1 : 0]dec_read_Q ;
generic_decoder #(.D(length)) readDecoder (
  .selectors(read_addres),
  .enable(read),
  .Q(dec_read_Q)
);
  
generate
genvar k;
   for(k = 0 ; k< length ; k=k+1)
     begin
       memory_word #(.R(word_width)) word (
          .clk(clk),
          .reset_n(reset_n),
          .select(dec_wri_Q[k] | dec_read_Q[k]),
          .write(dec_wri_Q[k]),
          .read(dec_read_Q[k]),
          .in_data(in_data),
          .out_data( ),
          .storage(storage[k])
       );

     end
endgenerate

assign out_data = storage[read_addres] ;

endmodule

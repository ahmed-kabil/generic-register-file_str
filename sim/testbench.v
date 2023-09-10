module register_file_tb #(parameter word_width = 32 , length = 128)  ();   ///   vsim -debugDB register_file_tb
reg clk ;
reg reset_n ;
reg [$clog2(length)-1 : 0]write_address ;
reg [$clog2(length)-1 : 0]read_address ;
reg write ;
reg read ;
reg [word_width-1 : 0]in_data ;
wire [word_width-1 : 0]out_data ;

register_file #(.word_width(word_width),.length(length)) UUT (
  .clk(clk),
  .reset_n(reset_n),
  .write_address(write_address),
  .read_address(read_address),
  .write(write),
  .read(read),
  .in_data(in_data),
  .out_data(out_data)
);

always
begin
clk = 1'b0 ; # 10
clk = 1'b1 ; # 10 ;
end

initial
begin
reset_n = 1'b0 ;                                               #2 ;
reset_n = 1'b1 ;
write = 1'b1 ; read = 1'b1 ;
read_address = 4 ; write_address = 0 ; in_data = 99999 ;       #100 ;
read_address = 57 ; write_address = 8 ; in_data = 888888888 ;  #100 ;
read_address = 8 ; write_address = 19 ; in_data = 654321 ;     #100 ;
read_address = 0 ; write_address = 30 ; in_data = 777 ;        #100 ;
write = 1'b0 ;
read_address = 100 ; write_address = 43 ; in_data = 66666 ;    #100 ;
write = 1'b1 ; read = 1'b0 ;
read_address = 30 ; write_address = 57 ; in_data = 575757 ;    #100 ;
read = 1'b1 ;
read_address = 57 ; write_address = 75 ; in_data = 444333 ;    #100 ;
read_address = 91 ; write_address = 91 ; in_data = 99999 ;     #100 ;
read_address = 120 ; write_address = 111 ; in_data = 22 ;      #100 ;
read_address = 111 ; write_address = 127 ; in_data = 0000000 ; #100 ;
reset_n = 1'b0 ;                                               #200 ;
reset_n =1'b1 ;
read_address = 8 ; write_address = 19 ; in_data = 654321 ;     #100 ;
read_address = 30 ; write_address = 57 ; in_data = 575757 ;    #100 ;
read_address = 57 ; write_address = 91 ; in_data = 99999 ;     #100 ;
end

endmodule

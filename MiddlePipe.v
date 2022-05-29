module MiddlePipe 
#(
	parameter    DW = 10
)
(
   
    input           Clk         ,
    input           Clear       ,
    input           Rstn        ,

  
    input  [DW-1:0] DataIn      ,
    input           DataInVld   ,
    output          DataInRdy   ,


    output [DW+1:0] DataOut     ,
    output          DataOutVld  ,
    input           DataOutRdy
);


always @ *
begin
    data_in_rdy = DataOutRdy || ~data_out_vld;
end

always @( posedge Clk or negedge Rstn )
begin
    if( ~Rstn )
        data_out <= 'h0;
    else if( data_in_rdy && DataInVld )//反压
        data_out <= DataIn << 1 + DataIn;
end

always @( posedge Clk or negedge Rstn )
begin
    if( ~Rstn )
        data_out_vld <= 'h0;
    else if( DataInVld )
        data_out_vld <= 'h1;
    else if( DataOutRdy && data_out_vld )
        data_out_vld <= 'h0;
end


endmodule
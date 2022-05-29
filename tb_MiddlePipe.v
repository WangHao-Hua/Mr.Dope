`timescale 1ns/1ps

module tb_MiddlePipe () ;

		reg 				Clk;
		reg 				Rstn;
				
		reg				DataOutRdy;  
		wire				DataOutVld;  
		wire				DataOut;
				
		
		reg				DataInVld;  
		reg				DataIn;
		wire				DataOutRdy; 


initial begin
		Clk <= 1'b0;
		Rstn <= 1'b1;
		DataOutRdy <= 0;DataInVld <= 0;DataIn <= 0;Rstn <= 1'b1;
		#10  DataOutRdy <= 1;DataInVld <= 0;DataIn <= 1;Rstn <= 1'b0;
		#10  DataOutRdy <= 0;DataInVld <= 1;DataIn <= 1;Rstn <= 1'b1;
		#10  DataOutRdy <= 1;DataInVld <= 0;DataIn <= 0;Rstn <= 1'b1;
		#10  DataOutRdy <= 1;DataInVld <= 0;DataIn <= 1;Rstn <= 1'b1;
		#10  DataOutRdy <= 0;DataInVld <= 1;DataIn <= 0;Rstn <= 1'b0;
		#10  DataOutRdy <= 1;DataInVld <= 0;DataIn <= 1;Rstn <= 1'b1;
		#10  DataOutRdy <= 0;DataInVld <= 1;DataIn <= 0;Rstn <= 1'b0;
		#10  $stop;
		$finish                         ;
end

always@(*) 
begin
		#10  Clk <= ~Clk;
end

MiddlePipe#(
    .DW          ( 1 )
)u_MiddlePipe(
    .Clk         ( Clk         ),
    .Rstn        ( Rstn        ),
    .DataIn      ( DataIn      ),
    .DataInVld   ( DataInVld   ),
    .DataInRdy   ( DataInRdy   ),
    .DataOut     ( DataOut     ),
    .DataOutVld  ( DataOutVld  ),
    .DataOutRdy  ( DataOutRdy  )
);

endmodule
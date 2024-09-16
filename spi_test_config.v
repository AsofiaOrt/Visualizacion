`timescale 1ns / 100ps

module spi_test_config;

	reg clk;
	reg reset;
	reg [3:0] nivel_hambre;
	reg [3:0] draw;

	wire mosi;

	// Outputs
	wire dc;
	wire sclk;
	wire sce;
	wire done;

	spi_configBunny uut(
	.clock(clk),
	.Reset(reset),
	.mosi(mosi),
	.sclk(sclk),
	.sce(sce),
	.dc(dc),
	.nivel_hambre(nivel_hambre),
	.draw(draw), 
	.done(done)
	);

	reg a;
	initial begin
	  clk = 0;
	  forever #1 clk = ~clk; //500Mhz
	 end
	  
	 initial begin 
	  reset=0; //se presiona reset primero para reinicializar todo
		#200;
		reset=1;
	  
	end
	
always @(posedge clk) begin

	
		if(done==1) begin a<=1; draw<=4'h1; nivel_hambre<=4'h3; end
		
	end
	
endmodule

module fifo_top();

      import uvm_pkg::*;
      import fifo_pkg::*;
   `include "uvm_macros.svh"

  bit clk;
  
  fifo_if inf(clk);
  
  //dut instantiation
  
  fifo DUT (.data_out(inf.data_out),
            .buf_full(inf.buf_full),
			.buf_empty(inf.buf_empty),
			.data_in(inf.data_in),
			.wr_enb(inf.wr_enb),
			.rd_enb(inf.rd_enb),
			.clk(inf.clk),
			.rst(inf.rst),
			.fifo_counter(inf.fifo_counter),
            .almost_full(inf.almost_full),
            .almost_empty(inf.almost_empty));
  
  always
   #10 clk = ~clk;
   
   initial begin
	 uvm_config_db #(virtual fifo_if)::set(null,"*","vif",inf);
     run_test("fifo_full_test");
	 $finish;
   end
   
endmodule


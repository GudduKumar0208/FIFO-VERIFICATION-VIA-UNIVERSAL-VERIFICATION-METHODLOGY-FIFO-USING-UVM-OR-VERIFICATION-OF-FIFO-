
 interface fifo_if (input bit clk);
   logic rst;
   
   logic [7:0] data_in;
   logic wr_enb,rd_enb;
   logic [7:0] data_out;
   logic buf_full,buf_empty;
   logic [3:0] fifo_counter;
   logic almost_empty,almost_full;
   
   
 clocking driver_cb @(posedge clk);
   default input #1 output #0;
    output data_in;
	output rst;
	output wr_enb,rd_enb;
	output buf_full,buf_empty;
	output fifo_counter;
	input almost_full,almost_empty;
 endclocking
 
 clocking monitor_cb @(posedge clk);
   default input #1 output #0;
    input data_in;
	input rst;
	input wr_enb,rd_enb;
	input data_out;
	input buf_full,buf_empty;
	input fifo_counter;
	input almost_full,almost_empty;
 endclocking
 
 modport DRIVER  (clocking driver_cb);
 modport MONITOR (clocking monitor_cb);
 
 endinterface
   
  

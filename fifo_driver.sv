class fifo_drv extends uvm_driver #(fifo_trans);

   `uvm_component_utils(fifo_drv)
 
   
   virtual fifo_if.DRIVER vif;
      
   function new (string name = "fifo_drv", uvm_component parent=null);
       super.new(name,parent);
   endfunction
   
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
   endfunction

    /*task reset_check();
     @(vif.driver_cb);
    vif.driver_cb.rst <= 1;
	 @(vif.driver_cb);
	vif.driver_cb.rst <= 0;
  endtask */
 
   
   task run_phase(uvm_phase phase);
   //  reset_check();
	     forever begin
	   seq_item_port.get_next_item(req);
	   send_to_dut(req);
	   seq_item_port.item_done();
	 end
   endtask
   
   task send_to_dut(fifo_trans req);
   //reset wait
   @(vif.driver_cb); begin

   //signal drive
    vif.driver_cb.rst <= req.rst; 
    vif.driver_cb.rd_enb <= req.rd_enb;
    vif.driver_cb.wr_enb <= req.wr_enb;
    vif.driver_cb.data_in <= req.data_in;
//$display("write data = %d",req.data_in);
    vif.driver_cb.buf_full <= req.buf_full;
    vif.driver_cb.buf_empty <= req.buf_empty;
   //  vif.driver_cb.almost_full <= req.almost_full;
   // vif.driver_cb.almost_empty <= req.almost_empty;

    vif.driver_cb.fifo_counter <= req.fifo_counter;
     end
   endtask
   
endclass


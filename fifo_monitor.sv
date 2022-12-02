class fifo_mon extends uvm_monitor;

 `uvm_component_utils(fifo_mon)
 
  uvm_analysis_port #(fifo_trans) analysis_port1;

    fifo_trans trans_h;
    
  virtual fifo_if.MONITOR vif;
  
  function new(string name = "fifo_mon",uvm_component parent = null);
    super.new(name,parent);
	analysis_port1 = new("analysis_port1",this);
  endfunction
  
  
   task run_phase(uvm_phase phase);
    forever begin
	 monitor();
	 analysis_port1.write(trans_h);
	end
   endtask
   
   task monitor();
      trans_h = new();
     @(vif.monitor_cb); 
   trans_h.wr_enb = vif.monitor_cb.wr_enb;
   trans_h.rd_enb = vif.monitor_cb.rd_enb;

   trans_h.data_in = vif.monitor_cb.data_in;
   trans_h.data_out = vif.monitor_cb.data_out;
   $display("wr_data = %0d",vif.monitor_cb.data_in);
   $display("rd_data = %0d",vif.monitor_cb.data_out);

   //trans_h.buf_full= vif.monitor_cb.buf_full;
   //trans_h.buf_empty = vif.monitor_cb.buf_empty;
   //trans_h.almost_full= vif.monitor_cb.almost_full;
  // trans_h.almost_empty = vif.monitor_cb.almost_empty;

   //trans_h.fifo_counter = vif.monitor_cb.fifo_counter;	
   
  endtask 
endclass  

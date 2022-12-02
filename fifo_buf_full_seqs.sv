class fifo_buf_full extends fifo_base_seqs;

 `uvm_object_utils(fifo_buf_full) 
  
   fifo_trans trans_h;

   function new(string name = "fifo_buf_full");
    super.new(name);  
   endfunction 

  virtual task body();
 //  repeat(10) begin
 for(int i=0; i<12; i++) begin
    `uvm_do_with (trans_h,{rst == 0; wr_enb==1; wr_ptr==i;})
   end
   $display("buffer  = %b ",trans_h.buf_full);
   
   endtask

endclass


  

 

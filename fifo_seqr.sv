class fifo_seqr extends uvm_sequencer #(fifo_trans);
 `uvm_component_utils(fifo_seqr)
 
 function new(string name = "fifo_seqr",uvm_component parent = null);
   super.new(name,parent);
 endfunction
 
endclass

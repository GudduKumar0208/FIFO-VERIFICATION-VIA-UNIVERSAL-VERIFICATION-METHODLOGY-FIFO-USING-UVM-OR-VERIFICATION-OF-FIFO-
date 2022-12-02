class fifo_virtual_seqr extends uvm_sequencer #(uvm_sequence_item);

 `uvm_component_utils(fifo_virtual_seqr)
 
 function new(string name = "fifo_virtual_seqr",uvm_component parent = null);
   super.new(name,parent);
 endfunction
 
//sub-sequencer handle
 fifo_seqr seqr_h;
 
endclass 

   

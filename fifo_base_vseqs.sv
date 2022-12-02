class fifo_base_vseqs extends uvm_sequence #(uvm_sequence_item);
 `uvm_object_utils(fifo_base_vseqs)
 
 rand int no_of_trans = 50;
 
 function new(string name = "fifo_base_vseqs");
  super.new(name);
 endfunction
 
 //virtual sequencer handle
  fifo_virtual_seqr vseqr_h;
  
 //sub-sequencer handle
  fifo_seqr seqr_h;
 // fifo_trans trans_h;
  task pre_body();
   
   if (!$cast(vseqr_h,m_sequencer))
    `uvm_fatal(get_type_name(),"virtual sequencer cast failed")
   seqr_h = vseqr_h.seqr_h;
  endtask

  	/*virtual task body();

	  repeat(no_of_trans) begin
	    //`uvm_do(trans);
	   // `uvm_do_with(trans_h, {wr_enb == 1; data_in > 150;});
	    trans_h=fifo_trans::type_id::create("trans_h");
	    start_item(trans_h);
	    assert(trans_h.randomize() with {data_in > 150;});
	    finish_item(trans_h); 
	  end

 	endtask */



endclass

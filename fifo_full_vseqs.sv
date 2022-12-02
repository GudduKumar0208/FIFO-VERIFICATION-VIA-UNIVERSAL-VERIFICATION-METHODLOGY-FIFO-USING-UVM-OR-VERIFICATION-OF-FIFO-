class fifo_full_vseqs extends fifo_base_vseqs;

 `uvm_object_utils(fifo_full_vseqs)

  function new (string name = "fifo_reset_vseqs");
  super.new(name);
  endfunction 

//   fifo_base_seqs seqs_h;
   fifo_buf_full     full_h;

   task body();
   fork 

  // seqs_h = fifo_base_seqs::type_id::create("seqs_h");
   full_h = fifo_buf_full::type_id::create("full_h");
 
  // void'(seqs_h.randomize() with {no_of_trans == 30;});
   void'(full_h.randomize());

  // seqs_h.start(seqr_h);
   full_h.start(seqr_h);

 join
 endtask 

endclass

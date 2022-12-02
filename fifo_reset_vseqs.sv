class fifo_reset_vseqs extends fifo_base_vseqs;

 `uvm_object_utils(fifo_reset_vseqs)

  function new (string name = "fifo_reset_vseqs");
  super.new(name);
  endfunction 

//   fifo_base_seqs seqs_h;
   fifo_reset     reset_h;

   task body();
   fork 

  // seqs_h = fifo_base_seqs::type_id::create("seqs_h");
   reset_h = fifo_reset::type_id::create("reset_h");
 
  // void'(seqs_h.randomize() with {no_of_trans == 30;});
   void'(reset_h.randomize() with {no_of_trans == 50;});

  // seqs_h.start(seqr_h);
   reset_h.start(seqr_h);

 join
 endtask 

endclass

class fifo_base_seqs extends uvm_sequence #(fifo_trans);

 `uvm_object_utils(fifo_base_seqs)
 
 //	 fifo_trans trans_h;
 rand int no_of_trans = 50;
  
  function new(string name = "fifo_base_seqs");
    super.new(name);
  endfunction
  
// task body();
	//  repeat(no_of_trans) begin
//   `uvm_do(trans_h);
    // `uvm_do_with(trans_h, {wr_data > 150;});
   
  /* `uvm_create(trans_h)
   `uvm_rand_send(trans_h)*/
   
 /*  `uvm_create(trans_h)
    assert(trans_h.randomize() with {wr_data > 150;});
   `uvm_send(trans_h)*/
   
 //  trans_h = fifo_trans::type_id::create("trans_h");
//   start_item(trans_h);
//   assert(trans_h.randomize());
//   finish_item(trans_h);
//   end
// endtask 
endclass 

class fifo_reset extends fifo_base_seqs;

`uvm_object_utils(fifo_reset)

  fifo_trans trans_h;

  function new(string name = "fifo_reset");
  super.new(name);
  endfunction

  virtual task body();
    //reset
  repeat(2) begin 
  trans_h=fifo_trans::type_id::create("trans_h");
  start_item(trans_h);
  assert(trans_h.randomize() with { rst == 1;});
  finish_item(trans_h);
  end

  repeat (40) begin 
  trans_h=fifo_trans::type_id::create("trans_h");
  start_item(trans_h);
  assert(trans_h.randomize() with {rst == 0;});
  finish_item(trans_h);
  end 

  //reset
  repeat(10) begin 
  trans_h=fifo_trans::type_id::create("trans_h");
  start_item(trans_h);
  assert(trans_h.randomize() with { rst == 1;});
  finish_item(trans_h);
  end

  repeat (40) begin 
  trans_h=fifo_trans::type_id::create("trans_h");
  start_item(trans_h);
  assert(trans_h.randomize() with { rst == 0;});
  finish_item(trans_h);
  end 
	
  endtask 

endclass 





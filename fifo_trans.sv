class fifo_trans extends uvm_sequence_item;
 
 rand bit [7:0] data_in;
 rand bit wr_enb;
 
 rand bit [7:0] data_out;
 rand bit rd_enb;
rand bit rst;
      reg [7:0] r[$];

   reg [7:0] exp_data;
      
  
rand bit buf_full,buf_empty;
 bit almost_full,almost_empty;
 
rand reg [2:0] rd_ptr,wr_ptr;                 //  read pointer and write pointer

rand bit [3:0] fifo_counter;
 
 //constraint wr_rd {wr_enb != rd_enb;};
 constraint wr_rd {wr_enb == 1; rd_enb == 1;}
 
 `uvm_object_utils_begin(fifo_trans)
   `uvm_field_int(rst,UVM_ALL_ON)
   `uvm_field_int(data_in,UVM_ALL_ON)
   `uvm_field_int(wr_enb,UVM_ALL_ON)
   `uvm_field_int(data_out,UVM_ALL_ON)
   `uvm_field_int(rd_enb,UVM_ALL_ON)
   `uvm_field_int(buf_full,UVM_ALL_ON)
   `uvm_field_int(buf_empty,UVM_ALL_ON)
   `uvm_field_int(almost_full,UVM_ALL_ON)
   `uvm_field_int(almost_empty,UVM_ALL_ON)
// `uvm_field_int(rd_ptr,UVM_ALL_ON)
// `uvm_field_int(wr_ptr,UVM_ALL_ON)
   `uvm_field_int(fifo_counter,UVM_ALL_ON)
// `uvm_field_int(exp_data,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name = "fifo_trans");
    super.new(name);
  endfunction	
  
endclass

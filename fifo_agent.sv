class fifo_agent extends uvm_agent;
  `uvm_component_utils(fifo_agent)
  
  virtual fifo_if vif;
  
  fifo_mon  mon_h;
  fifo_drv   drv_h;
  fifo_seqr seqr_h;
  
  function new (string name = "fifo_agent",uvm_component parent = null);
   super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   
   mon_h  = fifo_mon ::type_id::create("mon_h", this);
   drv_h   = fifo_drv  ::type_id::create("drv_h",  this);
   seqr_h = fifo_seqr::type_id::create("seqr_h",this);
   
   if(!uvm_config_db #(virtual fifo_if)::get(this,"","vif",vif))begin
    `uvm_fatal("FIFO_AGENT","the virtual interface get failed")
   end
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
   drv_h.seq_item_port.connect(seqr_h.seq_item_export);
   drv_h.vif  = vif;
   mon_h.vif = vif;

  endfunction
endclass

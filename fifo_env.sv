class fifo_env extends uvm_env;

  `uvm_component_utils(fifo_env)

     fifo_agent agnt_h;
     fifo_sb    sb_h;
     fifo_virtual_seqr vseqr_h;
  
  function new(string name = "fifo_env",uvm_component parent = null);
   super.new(name,parent);
  endfunction
  

  
  function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   
   agnt_h = fifo_agent::type_id::create("agnt_h" ,this);
   sb_h   = fifo_sb   ::type_id::create("fifo_sb",this);
   vseqr_h =fifo_virtual_seqr::type_id::create("vseqr_h",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   agnt_h.mon_h.analysis_port1.connect(sb_h.analysis_export1);

   vseqr_h.seqr_h = agnt_h.seqr_h;
  endfunction
  
endclass

`uvm_analysis_imp_decl(_fifo_mon)

class fifo_sb extends uvm_scoreboard;

	`uvm_component_utils(fifo_sb)

	 fifo_trans trans_h;

 uvm_analysis_imp_fifo_mon #(fifo_trans,fifo_sb) analysis_export1;
       
    

   function new(string name = "fifo_sb",uvm_component parent=null);
        super.new(name,parent);
         analysis_export1 = new("analysis_export1",this);
         trans_h = new();
   endfunction

      function void write_fifo_mon(fifo_trans trans_h);
       begin
	   
	 if (trans_h.wr_enb)begin
            // trans_h.r[trans_h.wr_ptr] = trans_h.data_in ;
	     trans_h.r.push_front(trans_h.data_in);
	end 

 
	 if (trans_h.rd_enb) begin
		  //trans_h.exp_data= trans_h.data_out;
		 trans_h.exp_data =  trans_h.r.pop_back();
	    end
       end
      if(trans_h.data_out !== 0 && trans_h.rd_enb==1) begin
		if(trans_h.data_out == trans_h.exp_data)
			$display("SUCCESS ! data_out = %d : %d = exp_data", trans_h.data_out, trans_h.exp_data);
		else begin
			$display("DATA MISMATCH ! rd_data =  %d : %d = exp_data", trans_h.data_out, trans_h.exp_data);
	end
        end


     endfunction

    
   	

  endclass

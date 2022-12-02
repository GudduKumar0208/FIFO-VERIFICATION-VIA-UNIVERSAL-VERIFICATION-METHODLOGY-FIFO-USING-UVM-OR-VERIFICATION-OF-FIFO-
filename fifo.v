module fifo (clk,rst,wr_enb,rd_enb,data_in,data_out,buf_empty,buf_full,fifo_counter, almost_full, almost_empty);

	input clk,rst,rd_enb,wr_enb;
	input [7:0]data_in;

 
	output   buf_empty,buf_full;
	output   almost_full, almost_empty;
 
	output reg  [3:0]fifo_counter;    
	output reg  [7:0]data_out;

	reg [7:0]fifo_ram[0:7];
	reg [2:0]rd_ptr, wr_ptr;

	assign buf_empty =(fifo_counter==0);
	assign almost_full = (fifo_counter==7);
	assign buf_full = (fifo_counter==8);
	assign almost_empty = (fifo_counter==15); 
	
/*	 always@(posedge clk)
		fork
			begin
			if(fifo_cnt==0)
				empty <= 1;
			else
				empty <= 0;
			end
			
			begin
			if(fifo_cnt==7)
				almost_full <= 1;
			else
				almost_full <= 0;
			end
			
			begin
			if(fifo_cnt==8)
				full <= 1;
			else
				full <= 0;
			end
		
			begin
			if(fifo_cnt==15)
				almost_empty <= 1;
			else
				almost_empty <= 0;
			end
		join */
 
	always@(posedge clk) 
		begin
		if(rst)
			wr_ptr <= 3'b0;
		else     
		begin
			if(wr_enb)	begin  
				fifo_ram[wr_ptr] <= data_in;
				wr_ptr <= wr_ptr +1'b1;
			end
		end
	end

	always@(posedge clk) 
		begin
		if(rst)
			rd_ptr <= 3'b00;
		else
		begin	   
			if(rd_enb | !buf_empty) begin
				data_out <= fifo_ram[rd_ptr];
				rd_ptr <= rd_ptr +1'b1;
			end
		end
	end  
  
	always@(posedge clk)
		begin
		if(rst) begin
			fifo_counter <= 4'b0;
		end
        else 
		begin
			case ({wr_enb,rd_enb})
			   2'b11: fifo_counter <= fifo_counter +1'b1;
			   2'b00: fifo_counter <= fifo_counter- 1'b1;
			   default:fifo_counter <= fifo_counter;
			endcase
		end
	end  
 endmodule

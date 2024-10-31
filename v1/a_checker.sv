checker a_checker (
     	clk,
    	rst,
     	rt,
     	rdy,
     	start,
     	endd,
     	er2,
	er3, 
	rdy3, 
	rdy4, 
	start4, 
	endd5, 
	stop5, 
	er5, 
	rdy5, 
	start5
	);

	default
	clocking @(posedge clk);
	endclocking

	default disable iff (rst);
	logic pom;
	always begin
		if(rt == 0) begin
			pom = 0;
		end
	end
	
	assert property (rt & pom |-> ~start & ~rdy & ~endd);
	assert property (er2 ##3 (~er2));
	assert property (er3 & rdy3 |-> (er3 | rdy3));
endchecker
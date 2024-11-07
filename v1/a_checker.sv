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
	start5,
	endd6,
	stop6,
	er6,
	rdy6,
	endd7,
	start7,
	status_valid7,
	instartsv7,
	rt8,
	enable8,
	rdy9,
	start9,
	interrupt9,
	ack10,
	req10
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
	assert property (!er2[*4]);
	assert property ((er3 & rdy3) |-> (~er3 || ~rdy3));
	assert property ((start4 & ~rdy4) |=> ##[0:$] rdy4);
	assert property ((endd5 || stop5 || er5) |=> ~rdy5);
	assert property ((endd6 || stop6 || er6) |-> rdy6);
	assert property (endd7 |-> (~status_valid7 & ~start7));
	assert property (rt8 |-> enable8);
	assert property ($fell(rt8) |-> ##[0:2] ~enable8);
	assert property ($fell(rdy9) || $fell(start9) |-> $past(interrupt9,1));
	assert property (req10 |-> ##5 ack10);
endchecker
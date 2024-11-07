library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zadaci is
port(
	clk : 		in std_logic;
	rst : 		in std_logic;
	rt : 		out std_logic;
	rdy : 		out std_logic;
	start: 		out std_logic;
	endd : 		out std_logic;
	er2 : 		out std_logic;
	er3 : 		out std_logic;
	rdy3 : 		out std_logic;
	rdy4 : 		out std_logic;
	start4 : 	out std_logic;
	endd5 : 	out std_logic;
	stop5 : 	out std_logic;
	er5 : 		out std_logic;
	rdy5 : 		out std_logic;
	start5 : 	out std_logic;
	endd6:		out std_logic;
	stop6:		out std_logic;
	er6	:	out std_logic;
	rdy6	:	out std_logic;
	endd7	:	out std_logic;
	start7	:	out std_logic;
	status_valid7:	out std_logic;
	instartsv7:	out std_logic;
	rt8:		out std_logic;
	enable8:	out std_logic;
	rdy9:		out std_logic;
	start9:		out std_logic;
	interrupt9:	out std_logic;
	ack10:		out std_logic;
	req10:		out std_logic
);
end zadaci;
architecture rtl of zadaci is

	signal cnt : unsigned (3 downto 0);
begin

process(clk)
begin
	if (rst='1') then
		cnt <= "0000";
	else
		if rising_edge(clk) then
		cnt <= cnt + "0001";
		end if;
	end if;

end process;

with cnt select
	rt <= '1' when "0000"|"0001"|"0010"|"0011"|"1001",'0' when others;

with cnt select
	rdy <= '1' when "0101",'0' when others;

with cnt select
	start <= '1' when "1001",'0' when others;

with cnt select
	endd <= '1' when "0110",'0' when others;

with cnt select
	er2 <= '1' when "0001"|"0010"|"0110"|"0111"|"1000"|"1001", '0' when others;

with cnt select
	er3 <= '1' when "0001"|"0101"|"0110"|"1001", '0' when others;

with cnt select
	rdy3 <= '1' when "0001"|"0010"|"0101"|"1001", '0' when others;
----------------*********************************************************************
with cnt select
	start4 <= '1' when "0010", '0' when others;

with cnt select
	rdy4 <= '1' when "0110", '0' when others;

with cnt select
	endd5 <= '1' when "0010", '0' when others;

with cnt select
	stop5 <= '0';

with cnt select
	er5 <= '1' when "1010", '0' when others;

with cnt select
	rdy5 <= '1' when "0001"|"0010"|"1000"|"1001"|"1010", '0' when others;

with cnt select
	start5 <= '1' when "1000", '0' when others;

with cnt select
	endd6 <= '1' when "0010", '0' when others;

with cnt select
	stop6 <= '1' when "0101", '0' when others;

with cnt select
	er6 <= '1' when "1010", '0' when others;

with cnt select
	rdy6 <= '1' when "0001"|"0010"|"0100"|"0101"|"0110"|"1001"|"1010", '0' when others;

with cnt select
	endd7 <= '1' when "0011", '0' when others;

with cnt select
	start7 <= '1' when "0101", '0' when others;

with cnt select
	status_valid7 <= '1' when "1010", '0' when others;

with cnt select
	instartsv7 <= '1' when "0011"|"0100"|"0101"|"0110"|"0111", '0' when others;

with cnt select
	rt8 <= '1' when "0000"|"0001"|"0010", '0' when others;

with cnt select
	enable8 <= '1' when "0111", '0' when others;

with cnt select
	rdy9 <= '1' when "0010"|"0011"|"0100"|"0101"|"0110"|"0111", '0' when others;

with cnt select
	start9 <= '1' when "0101"|"0110"|"0111", '0' when others;

with cnt select
	interrupt9 <= '1' when "0111", '0' when others;

with cnt select
	ack10 <= '1' when "0110", '0' when others;

with cnt select
	req10 <= '1' when "0001", '0' when others;


end rtl;
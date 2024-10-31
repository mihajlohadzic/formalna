library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zadaci is
port(
	clk : in std_logic;
	rst : in std_logic;
	rt : out std_logic;
	rdy : out std_logic;
	start : out std_logic;
	endd : out std_logic;
	er2 : out std_logic;
	er3 : out std_logic;
	rdy3 : out std_logic;
	rdy4 : out std_logic;
	start4 : out std_logic;
	endd5 : out std_logic;
	stop5 : out std_logic;
	er5 : out std_logic;
	rdy5 : out std_logic;
	start5 : out std_logic
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


end rtl;
Library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIFTYMHz_TO_1HZ_FREQ_DIVIDER is
port(
CLK_IN: in std_logic;
CLK_OUT: out std_logic
);
end FIFTYMHz_TO_1HZ_FREQ_DIVIDER;

architecture freq_division of FIFTYMHZ_TO_1HZ_FREQ_DIVIDER is

signal count: integer:=1;
signal tempout: std_logic:='0';

begin

process(CLK_IN)
begin
if (rising_edge(CLK_IN)) then
	count <= count + 1;
	if (count = 25000000) then
		tempout <= not tempout;
		count <= 1;
	end if;
end if;
CLK_OUT <= tempout;
end process;

end architecture;

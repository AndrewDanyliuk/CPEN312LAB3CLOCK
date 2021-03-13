Library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity count_sec_mins_hour is
port(
CLK, NRESET, LD_EN, TWELVEMODE: in std_logic;
PM: out std_logic;
LOADSEC, LOADMIN, LOADHR: in std_logic_vector(7 downto 0);
BIN_SEC_OUT, BIN_MIN_OUT: out std_logic_vector(5 downto 0);
BIN_HR_OUT: out std_logic_vector (4 downto 0)
);

end;

architecture counter of count_sec_mins_hour is
signal COUNTER_SECS: integer range 0 to 59;
signal COUNTER_MINS: integer range 0 to 59;
signal COUNTER_HRS: integer range 0 to 23;
signal COUNTER_TWELVEHRS: integer range 0 to 12;

begin

process(CLK,NRESET)
begin
	if NRESET='0' then
		COUNTER_SECS <= 0;
		COUNTER_MINS <= 0;
		COUNTER_HRS <= 0;
	
	elsif rising_edge(CLK) then
		
		if LD_EN = '1' then
			COUNTER_SECS <= TO_INTEGER(UNSIGNED(LOADSEC));
			COUNTER_MINS <= TO_INTEGER(UNSIGNED(LOADMIN));
			COUNTER_HRS <= TO_INTEGER(UNSIGNED(LOADHR));
		
		else
			
			if COUNTER_SECS = 59 then
				COUNTER_SECS <= 0;
					
					if COUNTER_MINS = 59 then
						COUNTER_MINS <= 0;
							
							if COUNTER_HRS = 23 then
								COUNTER_HRS <= 0;
							else COUNTER_HRS <= COUNTER_HRS + 1;
							end if;
						
					else
						COUNTER_MINS <= COUNTER_MINS + 1;
					end if;
			else
				COUNTER_SECS <= COUNTER_SECS + 1;
			end if;
	end if;
	end if;
	
	if TWELVEMODE = '1' then
		if COUNTER_HRS > 12 then
			COUNTER_TWELVEHRS <= COUNTER_HRS - 12;
			PM <= '1';
		else
			PM <= '0';
			if COUNTER_HRS = 0 then
				COUNTER_TWELVEHRS <= 12;
			else 
				COUNTER_TWELVEHRS <= COUNTER_HRS;
			end if;
		end if;
	else
		PM <= '0';
	end if;
	
	BIN_SEC_OUT <= std_logic_vector(TO_UNSIGNED(COUNTER_SECS, 6));
	BIN_MIN_OUT <= std_logic_vector(TO_UNSIGNED(COUNTER_MINS, 6));
	if TWELVEMODE = '1' then
		BIN_HR_OUT <= std_logic_vector(TO_UNSIGNED(COUNTER_TWELVEHRS, 5));
	else
		BIN_HR_OUT <= std_logic_vector(TO_UNSIGNED(COUNTER_HRS, 5));
	end if;
	
	end process;
	
	end architecture;
		
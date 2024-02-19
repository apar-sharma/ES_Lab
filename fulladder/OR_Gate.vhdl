
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity OR_GATE is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end OR_GATE;

architecture Behavioral of OR_GATE is

begin

process (A, B)

begin
	if(A = '0' and B = '0') then
		Y <= '0';
	else
		Y <= '1';
	end if;
end process;

end Behavioral;

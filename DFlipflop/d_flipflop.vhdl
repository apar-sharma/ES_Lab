library ieee;
use ieee.std_logic_1164.all;

entity d_flipflop is
    port (
        D, CLK, RESET: in std_logic;
        Q, Q_bar: out std_logic
    );
end entity d_flipflop;

architecture behavioral of d_flipflop is
    signal internal_Q: std_logic;
begin
    process (CLK, RESET)
    begin
        if (RESET = '1') then
            internal_Q <= '0';
        elsif rising_edge(CLK) then
            internal_Q <= D;
        end if;
    end process;

    Q <= internal_Q;
    Q_bar <= not internal_Q;
end architecture behavioral;

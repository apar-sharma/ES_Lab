library ieee;
use ieee.std_logic_1164.all;

entity d_flipflop_tb is
end entity d_flipflop_tb;

architecture testbench of d_flipflop_tb is
    signal D, CLK, RESET: std_logic := '0';
    signal Q, Q_bar: std_logic;
begin
    dut: entity work.d_flipflop
        port map (
            D => D,
            CLK => CLK,
            RESET => RESET,
            Q => Q,
            Q_bar => Q_bar
        );

    clk_process: process
    begin
        while now < 100 ns loop
            CLK <= '0';
            wait for 5 ns;
            CLK <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    stimulus_process: process
    begin
        -- Apply reset
        RESET <= '1';
        wait for 10 ns;
        RESET <= '0';

        -- Test D flip-flop behavior
        wait for 10 ns;
        D <= '0';  -- Set D=0
        wait for 10 ns;
        D <= '1';  -- Set D=1
        wait for 10 ns;
        D <= '0';  -- Set D=0
        wait for 10 ns;
        D <= '1';  -- Set D=1

        -- Add more test cases here if needed

        wait;
    end process;
end architecture testbench;

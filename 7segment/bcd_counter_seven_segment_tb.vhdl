library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_counter_seven_segment_tb is
end entity bcd_counter_seven_segment_tb;

architecture testbench of bcd_counter_seven_segment_tb is
    constant CLK_PERIOD: time := 10 ns;
    
    signal clk: std_logic := '0';
    signal rst: std_logic := '0';
    signal seven_segment_out: std_logic_vector(6 downto 0);

    constant SIMULATION_TIME: time := 20000 ns;  -- Simulation time in nanoseconds
begin
    uut: entity work.bcd_counter_seven_segment
        port map (
            clk => clk,
            rst => rst,
            seven_segment_out => seven_segment_out
        );

    clk_process: process
    begin
        while now < SIMULATION_TIME loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    stimulus_process: process
    begin
        rst <= '1';
        wait for CLK_PERIOD * 2;
        rst <= '0';
        wait for CLK_PERIOD * 2;

        wait for SIMULATION_TIME - CLK_PERIOD * 4;  -- Wait until end of simulation
        assert false report "End of simulation" severity note;
        wait;
    end process;
end architecture testbench;

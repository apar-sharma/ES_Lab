-- File: traffic_light_controller_tb.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic_light_controller_tb is
end traffic_light_controller_tb;

architecture tb of traffic_light_controller_tb is
    signal clk, rst : std_logic := '0';
    signal north_green, north_red, north_yellow, south_green, south_red, south_yellow,
          east_green, east_red, east_yellow, west_green, west_red, west_yellow : std_logic;
begin
    uut: entity work.traffic_light_controller
        port map (
            clk => clk,
            rst => rst,
            north_green => north_green,
            north_red => north_red,
            north_yellow => north_yellow,
            south_green => south_green,
            south_red => south_red,
            south_yellow => south_yellow,
            east_green => east_green,
            east_red => east_red,
            east_yellow => east_yellow,
            west_green => west_green,
            west_red => west_red,
            west_yellow => west_yellow
        );

    -- Clock generation process
    clk_process : process
    begin
        clk <= '0';
        wait for  10 ns;
        clk <= '1';
        wait for  10 ns;
    end process;

    -- Stimulus process
    stimulus_process : process
    begin
        -- Reset the system
        rst <= '1';
        wait for  10 ns;
        rst <= '0';

        -- Let the system run for a while
        wait for  1000 ns;

        -- End the simulation
        wait;
    end process stimulus_process;
end tb;

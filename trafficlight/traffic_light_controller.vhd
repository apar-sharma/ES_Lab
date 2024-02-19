-- File: traffic_light_controller.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic_light_controller is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        north_green : out std_logic;
        north_red : out std_logic;
        north_yellow : out std_logic;
        south_green : out std_logic;
        south_red : out std_logic;
        south_yellow : out std_logic;
        east_green : out std_logic;
        east_red : out std_logic;
        east_yellow : out std_logic;
        west_green : out std_logic;
        west_red : out std_logic;
        west_yellow : out std_logic
    );
end traffic_light_controller;

architecture Behavioral of traffic_light_controller is
    -- Define states for the traffic light controller
    type state_type is (north_green_state, north_yellow_state, north_red_state,
                          south_green_state, south_yellow_state, south_red_state,
                          east_green_state, east_yellow_state, east_red_state,
                          west_green_state, west_yellow_state, west_red_state);
    signal present_state, next_state : state_type;
begin
    -- State transition process
    process (present_state, rst)
    begin
        if rst = '1' then
            present_state <= north_green_state;
        elsif rising_edge(clk) then
            present_state <= next_state;
        end if;
    end process;

    -- State transition logic
    process (present_state)
    begin
        case present_state is
            when north_green_state =>
                next_state <= north_yellow_state;
            when north_yellow_state =>
                next_state <= north_red_state;
            when north_red_state =>
                next_state <= south_green_state;
            -- Define transitions for other states similarly
            -- ...
            when others =>
                next_state <= north_green_state;
        end case;
    end process;

    -- Output logic
    process (present_state)
    begin
        case present_state is
            when north_green_state =>
                north_green <= '1'; north_red <= '0'; north_yellow <= '0';
                -- Set other lights to red
                -- ...
            when north_yellow_state =>
                north_green <= '0'; north_red <= '0'; north_yellow <= '1';
                -- Set other lights to red
                -- ...
            -- Define outputs for other states similarly
            -- ...
            when others =>
                -- Default state
        end case;
    end process;
end Behavioral;

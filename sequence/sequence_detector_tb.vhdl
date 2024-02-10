library ieee;
use ieee.std_logic_1164.all;

entity sequence_detector_tb is
end entity sequence_detector_tb;

architecture testbench of sequence_detector_tb is
    constant CLK_PERIOD: time := 10 ns;
    
    signal clk, reset, input_bit, sequence_detected: std_logic := '0';
begin
    uut: entity work.sequence_detector
        port map (
            clk => clk,
            reset => reset,
            input_bit => input_bit,
            sequence_detected => sequence_detected
        );

    clk_process: process
    begin
        while now < 100 ns loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    stimulus_process: process
    begin
        -- Reset
        reset <= '1';
        wait for 10 ns;
        reset <= '0';

        -- Test sequence detection
        input_bit <= '1';  -- Start with input bit high
        wait for CLK_PERIOD * 2;
        input_bit <= '0';
        wait for CLK_PERIOD;
        input_bit <= '1';
        wait for CLK_PERIOD;
        input_bit <= '0';
        wait for CLK_PERIOD;
        input_bit <= '1';  -- Sequence detected
        wait for CLK_PERIOD * 2;

        -- Reset and test again
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        input_bit <= '0';  -- Start with input bit low
        wait for CLK_PERIOD * 2;
        input_bit <= '1';
        wait for CLK_PERIOD;
        input_bit <= '0';
        wait for CLK_PERIOD;
        input_bit <= '1';
        wait for CLK_PERIOD;
        input_bit <= '1';  -- Sequence detected
        wait for CLK_PERIOD * 2;

        -- Add more test cases here if needed

        wait;
    end process;
end architecture testbench;

library ieee;
use ieee.std_logic_1164.all;

entity decoder_3to8_tb is
end entity decoder_3to8_tb;

architecture testbench of decoder_3to8_tb is
    component decoder_3to8
        port (
            A, B, C: in std_logic;
            Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7: out std_logic
        );
    end component;

    signal A, B, C: std_logic;
    signal Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7: std_logic;
begin
    uut: decoder_3to8
    port map (
        A => A,
        B => B,
        C => C,
        Y0 => Y0,
        Y1 => Y1,
        Y2 => Y2,
        Y3 => Y3,
        Y4 => Y4,
        Y5 => Y5,
        Y6 => Y6,
        Y7 => Y7
    );

    -- Stimulus process
    stimulus_process: process
    begin
        A <= '0'; B <= '0'; C <= '0';
        wait for 10 ns;

        A <= '0'; B <= '0'; C <= '1';
        wait for 10 ns;

        A <= '0'; B <= '1'; C <= '0';
        wait for 10 ns;

        A <= '0'; B <= '1'; C <= '1';
        wait for 10 ns;

        A <= '1'; B <= '0'; C <= '0';
        wait for 10 ns;

        A <= '1'; B <= '0'; C <= '1';
        wait for 10 ns;

        A <= '1'; B <= '1'; C <= '0';
        wait for 10 ns;

        A <= '1'; B <= '1'; C <= '1';
        wait for 10 ns;

        wait;
    end process;
end architecture testbench;

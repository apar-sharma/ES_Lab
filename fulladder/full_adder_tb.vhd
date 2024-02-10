library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture tb of full_adder_tb is
    signal A, B, Cin, Sum, Cout : std_logic;
begin
    uut: entity work.full_adder
        port map (
            A => A,
            B => B,
            Cin => Cin,
            Sum => Sum, -- Associating the Sum signal
            Cout => Cout -- Associating the Cout signal
        );

    -- Provide stimulus to the full adder
    stimulus: process
    begin
        -- Initialize inputs
        A <= '0'; B <= '0'; Cin <= '0';
        wait for  10 ns;

        -- Apply different input combinations
        A <= '1'; B <= '0'; Cin <= '0'; wait for  10 ns;
        A <= '0'; B <= '1'; Cin <= '0'; wait for  10 ns;
        A <= '1'; B <= '1'; Cin <= '0'; wait for  10 ns;
        A <= '0'; B <= '0'; Cin <= '1'; wait for  10 ns;
        A <= '1'; B <= '0'; Cin <= '1'; wait for  10 ns;
        A <= '0'; B <= '1'; Cin <= '1'; wait for  10 ns;
        A <= '1'; B <= '1'; Cin <= '1'; wait for  10 ns;

        -- End the simulation
        wait;
    end process stimulus;
end tb;

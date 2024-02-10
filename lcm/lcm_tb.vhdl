library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity lcm_tb is
end lcm_tb;

architecture behavior of lcm_tb is
    -- Component declaration for the LCM module
    component LCM
        Port ( RESET : in  STD_LOGIC;
               CLK : in  STD_LOGIC;
               NUM1 : in  INTEGER;
               NUM2 : in  INTEGER;
               LCM : out  INTEGER);
    end component;

    -- Signals for lcm_tb
    signal RESET : STD_LOGIC := '0';
    signal CLK : STD_LOGIC := '0';
    signal NUM1, NUM2, Result_LCM : INTEGER;
begin
    -- Instantiate the LCM module
    DUT: LCM port map (RESET, CLK, NUM1, NUM2, Result_LCM);

    -- Clock process
    CLK_Process : process
    begin
        while now < 1000 ns loop
            CLK <= '0';
            wait for 10 ns;
            CLK <= '1';
            wait for 10 ns;
        end loop;
        wait;
    end process;

    -- Test cases
    process
    begin
        -- Test case 1: Basic test case
        NUM1 <= 3;
        NUM2 <= 5;
        wait for 100 ns;
        assert (Result_LCM = 15) report "Test case 1 failed" severity error;

        -- Test case 2: Edge case with one input as zero
        NUM1 <= 0;
        NUM2 <= 7;
        wait for 100 ns;
        assert (Result_LCM = 0) report "Test case 2 failed" severity error;

        -- Add more test cases here...

        wait;
    end process;
end behavior;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY HA_tf IS
END HA_tf;
 
ARCHITECTURE behavior OF HA_tf IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Half_Adder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         S : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal C : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Half_Adder PORT MAP (
          A => A,
          B => B,
          S => S,
          C => C
        );

   -- Clock process definitions
   -- <clock>_process :process
   -- begin
		-- <clock> <= '0';
		-- wait for <clock>_period/2;
		-- <clock> <= '1';
		-- wait for <clock>_period/2;
   -- end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
	 A <= '0';
    B <= '0';
    wait for 10 ns;
	 
    A <= '0';
    B <= '1';
    wait for 10 ns;
	 
    A <= '1';
    B <= '0';
    wait for 10 ns;
	 
    A <= '1';
    B <= '1';
    wait for 10 ns;

      -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY FA_tb IS
END FA_tb;
 
ARCHITECTURE behavior OF FA_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_Adder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         CIN : IN  std_logic;
         S : OUT  std_logic;
         COUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal CIN : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal COUT : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder PORT MAP (
          A => A,
          B => B,
          CIN => CIN,
          S => S,
          COUT => COUT
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
		
 
 -- insert stimulus here
 
 A <= '1';
 B <= '0';
 CIN <= '0';
 wait for 10 ns;
 
 A <= '0';
 B <= '1';
 CIN <= '0';
 wait for 10 ns;
 
 A <= '1';
 B <= '1';
 CIN <= '0';
 wait for 10 ns;
 
 A <= '0';
 B <= '0';
 CIN <= '1';
 wait for 10 ns;
 
 A <= '1';
 B <= '0';
 CIN <= '1';
 wait for 10 ns;
 
 A <= '0';
 B <= '1';
 CIN <= '1';
 wait for 10 ns;
 
 A <= '1';
 B <= '1';
 CIN <= '1';
 wait for 10 ns;
 


      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
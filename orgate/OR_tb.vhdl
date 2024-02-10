

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY OR_tb IS
END OR_tb;
 
ARCHITECTURE behavior OF OR_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OR_Gate
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal Y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OR_Gate PORT MAP (
          A => A,
          B => B,
          Y => Y
        );

   -- Clock process definitions 
 --  <clock>_process :process
 --  begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		wait for 100 ns;	

		A<='0';
		B<='0';
		
      wait for 100 ns;	
		
		A<='0';
		B<='1';
		
      wait for 100 ns;	
		
		A<='1';
		B<='0';
		
      wait for 100 ns;
		
      A<='1';
		B<='1';
		


      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
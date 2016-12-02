--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:43:06 11/30/2016
-- Design Name:   
-- Module Name:   C:/Users/pc/Documents/trabajoSED_Rotulo/ROTULO/decod_letra_7seg_tb.vhd
-- Project Name:  ROTULO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decod_letra_7seg
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY decod_letra_7seg_tb IS
END decod_letra_7seg_tb;
 
ARCHITECTURE behavior OF decod_letra_7seg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decod_letra_7seg
    PORT(
         letra : IN  CHARACTER;
         leds : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal letra : CHARACTER := 'A';

 	--Outputs
   signal leds : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	
	type vtest is record 
			letra : CHARACTER;
			leds : std_logic_vector (6 downto 0) ;
	end record;
	
		
	TYPE vtest_vector IS ARRAY (natural RANGE <>) OF vtest;
			
 CONSTANT test: vtest_vector := (
		 (letra => 'A', leds => "1110111"),
		 (letra => 'B', leds => "0011111"),
		 (letra => 'C', leds => "1001110"),
		 (letra => 'D', leds => "0111101"),
		 (letra => 'E', leds => "1001111"),
		 (letra => 'F', leds => "1000111"),
		 (letra => 'G', leds => "1111011"),
		 (letra => 'H', leds => "0110111"),
		 (letra => 'I', leds => "0000110"),
		 (letra => 'J', leds => "0111100"),
		 (letra => 'K', leds => "0110111"),
		 (letra => 'L', leds => "0001110"),
		 (letra => 'M', leds => "1010100"),
		 (letra => 'N', leds => "0010101"),
		 (letra => 'O', leds => "1111110"),
		 (letra => 'P', leds => "1100111"),
		 (letra => 'Q', leds => "1110111"),
		 (letra => 'R', leds => "0000101"),
		 (letra => 'S', leds => "1011011"),
		 (letra => 'T', leds => "0001111"),
		 (letra => 'U', leds => "0111110"),
		 (letra => 'V', leds => "0011100"),
		 (letra => 'W', leds => "0101010"),
		 (letra => 'X', leds => "0110111"),
		 (letra => 'Y', leds => "0111011"),
		 (letra => 'Z', leds => "1101101")
	 );
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decod_letra_7seg PORT MAP (
          letra => letra,
          leds => leds
        );

   -- Clock process definitions
 --  <clock>_process :process
 --  begin
--		<clock> <= '0';
	--	wait for <clock>_period/2;
		--<clock> <= '1';
--		wait for <clock>_period/2;
 --  end process;
 

   -- Stimulus process
 --  stim_proc: process
  -- begin		
      -- hold reset state for 100 ns.
    --  wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 

    --  wait;
  -- end process;
  
  tb: PROCESS
 BEGIN
	 FOR i IN 0 TO test'HIGH LOOP
		 letra <= test(i).letra;
		 WAIT FOR 20 ns;
		 ASSERT leds = test(i).leds
		 REPORT "Salida incorrecta."
	 SEVERITY FAILURE;
	 END LOOP;
		 ASSERT false
		 REPORT "Simulación finalizada. Test superado."
		 SEVERITY FAILURE;
 END PROCESS;

END;

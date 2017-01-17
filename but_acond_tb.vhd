--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:33:39 01/17/2017
-- Design Name:   
-- Module Name:   C:/Users/pc/Documents/trabajoSED_Rotulo/ForPrintingGeniusArrays/but_acond_tb.vhd
-- Project Name:  ROTULO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: but_acond
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
 
ENTITY but_acond_tb IS
END but_acond_tb;
 
ARCHITECTURE behavior OF but_acond_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT but_acond
    PORT(
         reset : IN  std_logic;
         clk_in : IN  std_logic;
         but_in : IN  std_logic;
         but_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk_in : std_logic := '0';
   signal but_in : std_logic := '0';

 	--Outputs
   signal but_out : std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: but_acond PORT MAP (
          reset => reset,
          clk_in => clk_in,
          but_in => but_in,
          but_out => but_out
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 5 ms;

		but_in <= '1';
		wait for clk_in_period;
		but_in <= '0';
		wait for clk_in_period;
		but_in <= '1';
		wait for clk_in_period;
		but_in <= '0';
		wait for clk_in_period;
		but_in <= '1';
		
		wait for 20 ms;
		
		but_in <= '0';
		wait for clk_in_period;
		but_in <= '1';
		wait for clk_in_period;
		but_in <= '0';
		wait for clk_in_period;
		but_in <= '1';
		wait for clk_in_period;
		but_in <= '0';
		wait for clk_in_period;

      wait for clk_in_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;

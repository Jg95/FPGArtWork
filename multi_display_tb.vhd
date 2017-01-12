--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:05:18 01/12/2017
-- Design Name:   
-- Module Name:   C:/Users/pc/Documents/trabajoSED_Rotulo/ForPrintingGeniusArrays/multi_display_tb.vhd
-- Project Name:  ROTULO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multi_display
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
 
ENTITY multi_display_tb IS
END multi_display_tb;
 
ARCHITECTURE behavior OF multi_display_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multi_display
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         message : IN  string(4 downto 1);
         digit : OUT  std_logic_vector(3 downto 0);
         segment : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal message : string(4 downto 1) := "HOLA";

 	--Outputs
   signal digit : std_logic_vector(3 downto 0);
   signal segment : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multi_display PORT MAP (
          reset => reset,
          clk => clk,
          message => message,
          digit => digit,
          segment => segment
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	
		
      wait for clk_period*10;

      -- insert stimulus here 
		assert false severity failure;
		
      wait;
   end process;

END;

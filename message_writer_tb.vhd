--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:50:02 01/19/2017
-- Design Name:   
-- Module Name:   C:/Users/pc/Documents/trabajoSED_Rotulo/ForPrintingGeniusArrays/message_writer_tb.vhd
-- Project Name:  ROTULO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: message_writer
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
 
ENTITY message_writer_tb IS
END message_writer_tb;
 
ARCHITECTURE behavior OF message_writer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT message_writer
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         plus : IN  std_logic;
         minus : IN  std_logic;
			mode : in std_logic;
         output : OUT  character
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal plus : std_logic := '0';
   signal minus : std_logic := '0';
	signal mode : std_logic := '1';

 	--Outputs
   signal output : character;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: message_writer PORT MAP (
          clk => clk,
          reset => reset,
          plus => plus,
          minus => minus,
			 mode => mode,
          output => output
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
      wait for 100 ns;	

		plus <= '1';
		wait for clk_period*2;
		
		plus <= '0';
		
      wait for clk_period*10;
		plus <= '1';
		wait for clk_period*2;
		
		plus <= '0';
		
      wait for clk_period*10;
		
		minus <= '1';
		wait for clk_period*2;
		
		minus <= '0';
		
      wait for clk_period*10;
		minus <= '1';
		wait for clk_period*2;
		
		minus <= '0';
		
      wait for clk_period*10;		
      -- insert stimulus here 

      wait;
   end process;

END;

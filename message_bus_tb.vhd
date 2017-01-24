--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:46:24 01/12/2017
-- Design Name:   
-- Module Name:   C:/Users/pc/Documents/trabajoSED_Rotulo/ForPrintingGeniusArrays/message_bus_tb.vhd
-- Project Name:  ROTULO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: message_bus
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
 
ENTITY message_bus_tb IS
END message_bus_tb;
 
ARCHITECTURE behavior OF message_bus_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT message_bus
    PORT(
         reset : IN  std_logic;
         clk 	: IN  std_logic;
         acel 	: IN  std_logic;
         decel : IN  std_logic;
			mode: in std_logic;
			global_message : in string(12 downto 1);
			changing_message : in string(4 downto 1);
         digit : OUT  std_logic_vector(3 downto 0);
         segment : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal acel : std_logic := '0';
   signal decel : std_logic := '0';
	signal mode : std_logic := '0';
	signal changing_message : string(4 downto 1) := "    ";
	signal global_message : string(12 downto 1) := "HOLA LUIS   ";

 	--Outputs
   signal digit : std_logic_vector(3 downto 0);
   signal segment : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: message_bus PORT MAP (
          reset => reset,
          clk => clk,
          acel => acel,
          decel => decel,
			 mode => mode,
			 global_message => global_message,
			 changing_message => changing_message,
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
      wait for 100 ns;	
		
		--reset <= '1';
		
		wait for clk_period * 2;
		
		--reset <= '0';
		
		wait for clk_period * 50;
		
		--reset <= '1';
		
		wait for clk_period * 2;
		
		--reset <= '0';
		
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
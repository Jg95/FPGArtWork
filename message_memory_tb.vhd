--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:53:03 01/20/2017
-- Design Name:   
-- Module Name:   C:/Users/pc/Documents/trabajoSED_Rotulo/ForPrintingGeniusArrays/message_memory_tb.vhd
-- Project Name:  ROTULO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: message_memory
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
 
ENTITY message_memory_tb IS
END message_memory_tb;
 
ARCHITECTURE behavior OF message_memory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT message_memory
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         acel : IN  std_logic;
         decel : IN  std_logic;
         m_selec : IN  std_logic_vector(2 downto 0);
         mode : IN  std_logic;
         selec : IN  std_logic;
         digit : OUT  std_logic_vector(3 downto 0);
         segment : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal acel : std_logic := '0';
   signal decel : std_logic := '0';
   signal m_selec : std_logic_vector(2 downto 0) := (others => '0');
   signal mode : std_logic := '0';
   signal selec : std_logic := '0';

 	--Outputs
   signal digit : std_logic_vector(3 downto 0);
   signal segment : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: message_memory PORT MAP (
          reset => reset,
          clk => clk,
          acel => acel,
          decel => decel,
          m_selec => m_selec,
          mode => mode,
          selec => selec,
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
	
		m_selec <= "100";
		wait for clk_period*50;
		m_selec <= "110";
      wait for clk_period*10;
		m_selec <= "101";
		wait for clk_period;
		
		mode <= '1';
		
		wait for clk_period;
		acel <= '1';
		wait for clk_period;
		acel <= '0';
		wait for clk_period;
		acel <= '1';
		wait for clk_period;
		acel <= '0';
		wait for clk_period;
		
		selec <= '1';
		wait for clk_period;
		selec <= '0';
		wait for clk_period;
		
		decel <= '1';
		wait for clk_period;
		decel <= '0';
		wait for clk_period;
		decel <= '1';
		wait for clk_period;
		decel <= '0';
		wait for clk_period;
		
		selec <= '1';
		wait for clk_period;
		selec <= '0';
		wait for clk_period;
		
		selec <= '1';
		wait for clk_period;
		selec <= '0';
		wait for clk_period;
		
		selec <= '1';
		wait for clk_period;
		selec <= '0';
		wait for clk_period;
		
		selec <= '1';
		wait for clk_period;
		selec <= '0';
		wait for clk_period;
		
		mode <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;

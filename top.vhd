----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:58:31 12/05/2016 
-- Design Name: 
-- Module Name:    top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



entity top is
	generic (
		clock_freq: natural := 50000000
	);
	port (
		reset  : in  std_logic;
		clk_in : in  std_logic;	
		acel   : in  std_logic;
		decel  : in  std_logic;
		digit  : out std_logic_vector ( 3 downto 0);
		segment: out std_logic_vector ( 7 downto 0)
	);
end top;

architecture behavioral of top is

begin


end behavioral;

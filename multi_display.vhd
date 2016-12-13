----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:46:12 12/13/2016 
-- Design Name: 
-- Module Name:    multi_display - Behavioral 
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

entity multi_display is
	port(
		reset		: in std_logic;							--reset
		clk		: in std_logic;							--reloj
		message	: in string(4 downto 1);				--mensaje enviado
		digit		: out std_logic_vector(3 downto 0);	--seleccion de display
		segment	: out std_logic_vector(7 downto 0)	--seleccion de segmentos
	);
end multi_display;

architecture Behavioral of multi_display is

begin


end Behavioral;


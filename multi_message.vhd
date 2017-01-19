----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:27:47 01/19/2017 
-- Design Name: 
-- Module Name:    multi_message - Behavioral 
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

entity multi_message is
	port(
		reset		: in	std_logic;
		clk		: in	std_logic;
		acel		: in	std_logic;
		decel		: in	std_logic;
		segment	: out std_logic_vector(7 downto 0);
		digit		: out std_logic_vector(3 downto 0)
	);
end multi_message;

architecture Behavioral of multi_message is

	component message_bus is
		port(
			reset		: in std_logic;							--reset
			clk		: in std_logic;							--reloj
			acel		: in std_logic;							--boton de aceleracion
			decel		: in std_logic;							--boton de deceleracion
			digit		: out std_logic_vector(3 downto 0);	--seleccion del display
			segment	: out std_logic_vector(7 downto 0)	--seleccion de segmentos
		);

begin

	message_in: message_bus
		port map(
			reset		=> reset,
			clk 		=> clk,
			acel		=> acel,
			decel		=> decel,
			digit		=> digit,
			segment	=> segment
		);

end Behavioral;


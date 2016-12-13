----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:04:19 12/13/2016 
-- Design Name: 
-- Module Name:    message_bus - Behavioral 
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

entity message_bus is
	port(
		reset		: in std_logic;							--reset
		clk		: in std_logic;							--reloj
		acel		: in std_logic;							--boton de aceleracion
		decel		: in std_logic;							--boton de deceleracion
		digit		: out std_logic_vector(3 downto 0);	--seleccion del display
		segment	: out std_logic_vector(7 downto 0)	--seleccion de segmentos
	);
end message_bus;

signal mensaje: string(10 downto 0);

architecture Behavioral of message_bus is

begin	

	

end Behavioral;

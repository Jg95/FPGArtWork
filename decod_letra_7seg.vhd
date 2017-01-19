----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:20:33 11/30/2016 
-- Design Name: 
-- Module Name:    decod_letra_7seg - Behavioral 
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

entity decod_letra_7seg is
   Port ( 
		letra : in  character;
		leds: out  STD_LOGIC_VECTOR ( 6 downto 0)
	);
end decod_letra_7seg;

architecture dataflow of decod_letra_7seg is

signal sig_leds: std_logic_vector (6 downto 0) := (others => '0');

begin
with letra select 
		sig_leds <= "1110111" when 'A',
						"0011111" when 'B',
						"1001110" when 'C',
						"0111101" when 'D',
						"1001111" when 'E',
						"1000111" when 'F',
						"1111011" when 'G',
						"0110111" when 'H',
						"0000110" when 'I',
						"0111100" when 'J',
						"0110111" when 'K',
						"0001110" when 'L',
						"1010100" when 'M',
						"0010101" when 'N',
						"1111110" when 'O',
						"1100111" when 'P',
						"1110011" when 'Q',
						"0000101" when 'R',
						"1011011" when 'S',
						"0001111" when 'T',
						"0111110" when 'U',
						"0011100" when 'V',
						"0101010" when 'W',
						"0110111" when 'X',
						"0111011" when 'Y',
						"1101101" when 'Z',
						"1100101" when '?',
						"0000000" when others;
		leds <= NOT sig_leds;

end dataflow;


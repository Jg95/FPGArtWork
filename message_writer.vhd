----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:25:41 01/19/2017 
-- Design Name: 
-- Module Name:    message_writer - Behavioral 
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

entity message_writer is

port(
	clk : in std_logic;
	reset : in std_logic;
	plus : in std_logic;
	minus : in std_logic;
	mode : in std_logic;
	output : out character
	);
end message_writer;


architecture Behavioral of message_writer is

signal coded : integer := 1;
signal prev_plus : std_logic := '0';
signal prev_minus : std_logic := '0';
begin

process(clk, reset, plus, minus)


begin
	if ( reset = '1' ) then 
		coded <= 1;
	elsif ( clk'event and clk = '1' ) then
		if mode = '1' then
			if ( plus = '1' and prev_plus = '0' ) then 
				if ( coded < 28 ) then 
					coded <= coded + 1;
				else 
					coded <= 1;
				end if;
			elsif ( minus = '1' and prev_minus = '0') then 
				if( coded = 1) then 
					coded <= 28;
				else 
					coded <= coded - 1 ;
				end if;
			end if;
		else
			coded <= 1;
		end if;
		prev_minus <= minus;
		prev_plus <= plus;
	end if;
	case coded is 
		when 1 => output <= 'A';
		when 2 => output <= 'B';
		when 3 => output <= 'C';
		when 4 => output <= 'D';
		when 5 => output <= 'E';
		when 6 => output <= 'F';
		when 7 => output <= 'G';
		when 8 => output <= 'H';
		when 9 => output <= 'I';
		when 10 => output <= 'J';
		when 11 => output <= 'K';
		when 12 => output <= 'L';
		when 13 => output <= 'M';
		when 14 => output <= 'N';
		when 15 => output <= 'O';
		when 16 => output <= 'P';
		when 17 => output <= 'Q';
		when 18 => output <= 'R';
		when 19 => output <= 'S';
		when 20 => output <= 'T';
		when 21 => output <= 'U';
		when 22 => output <= 'V';
		when 23 => output <= 'W';
		when 24 => output <= 'X';
		when 25 => output <= 'Y';
		when 26 => output <= 'Z';
		when 27 => output <= '?';
		when 28 => output <= ' ';
		when others => output <= ' ';
	end case;
	
END PROCESS;
end Behavioral;


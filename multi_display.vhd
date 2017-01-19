<<<<<<< HEAD
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
	generic(
		divide_freq	: integer	:= 100000 --Usar 2 para simulaciones
	);
	port(
		reset		: in std_logic;							--reset
		clk		: in std_logic;							--reloj
		message	: in string(4 downto 1);				--mensaje enviado
		digit		: out std_logic_vector(3 downto 0);	--seleccion de display
		segment	: out std_logic_vector(7 downto 0)	--seleccion de segmentos
	);
end multi_display;

architecture Behavioral of multi_display is

signal letra: character := ' ';
signal i: integer := 4;
signal sig_digit: std_logic_vector(3 downto 0) := "0111";
signal j: integer := divide_freq; 
	
component decod_letra_7seg is
   port ( 
		letra : in  character;
		leds: out  std_logic_vector(6 downto 0)
	);
end component;

	begin

	decoder: decod_letra_7seg
			port map(
				letra 	=> letra,
				leds		=> segment(7 downto 1)
			);
	
	process (clk, reset)
	begin
		segment(0) <= '1';
		if (reset = '1') then
			digit <= "1111";
			i <= 4;
			j <= divide_freq;
			sig_digit <= "0111";
		elsif (clk'event) and (clk = '1') then
			if j = 0 then
				letra <= message(i);
				case sig_digit is
					when "0111" => sig_digit <= "1011";
					when "1011" => sig_digit <= "1101";
					when "1101" => sig_digit <= "1110";
					when others => sig_digit <= "0111";
				end case;
				digit <= sig_digit;
				if (i = 1) then
					i <= 4;
				else
					i <= i - 1;
				end if;
				j <= divide_freq;
			else
				j <= j - 1;
			end if;
		end if;
	end process;

end Behavioral;

=======
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

signal letra: character;
signal i: integer := 4;
signal sig_digit: std_logic_vector(3 downto 0) := "1000"; 
	
component decod_letra_7seg is
   port ( 
		letra : in  character;
		leds: out  std_logic_vector(6 downto 0)
	);
end component;

	begin

	decoder: decod_letra_7seg
			port map(
				letra 	=> letra,
				leds		=> segment(7 downto 1)
			);
	
	process (clk, reset)
	begin
		segment(0) <= '0';
		if (reset = '1') then
			sig_digit <= "1000";
			i <= 4;
		elsif (clk'event) and (clk = '1') then
			letra <= message(i);
			case sig_digit is
				when "1000" => sig_digit <= "0100";
				when "0100" => sig_digit <= "0010";
				when "0010" => sig_digit <= "0001";
				when others => sig_digit <= "1000";
			end case;
			digit <= sig_digit;
			if (i = 1) then
				i <= 4;
			else
				i <= i - 1;
			end if;
		end if;
	end process;

end Behavioral;

>>>>>>> origin/develop

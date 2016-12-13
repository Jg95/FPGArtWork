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
	generic(
		clock_freq	: natural := 50000000;
		interval		: float := 0.25
	);
	port(
		reset		: in std_logic;							--reset
		clk		: in std_logic;							--reloj
		acel		: in std_logic;							--boton de aceleracion
		decel		: in std_logic;							--boton de deceleracion
		digit		: out std_logic_vector(3 downto 0);	--seleccion del display
		segment	: out std_logic_vector(7 downto 0)	--seleccion de segmentos
	);
end message_bus;

architecture Behavioral of message_bus is
	
	component multi_display is
		port(
			reset		: in std_logic;							--reset
			clk		: in std_logic;							--reloj
			message	: in string(4 downto 1);				--mensaje enviado
			digit		: out std_logic_vector(3 downto 0);	--seleccion de display
			segment	: out std_logic_vector(7 downto 0)	--seleccion de segmentos
		);
	end component;
	
	component counter is
		port(
			reset			: in std_logic;	--reset
			clk			: in std_logic;	--reloj
			count_max	: in natural;		--end of the counter
			result		: out std_logic	--'1' if the counter has ended
		);
	end component;
		
	constant global_message: string(9 downto 1) := "HOLA LUIS"; --Las string no tienen 0
	signal start_message: natural := 9; --Indice de inicio mostrado de global message
	signal message_to_send: string(4 downto 1);
	signal timer_max: natural := clock_freq;
	signal trigger: std_logic := 0;
	
begin	
	message_to_send <= global_message(start_message downto start_mesagge-3);
	
	message_handler: multi_display
		port map(
			reset		=> reset,
			clk		=> clk,
			message	=> message_to_send,
			digit		=> digit,
			segment	=> segment
		);
		
	timer: counter
		port map(
			reset 		=> reset,
			clk			=> clk,
			count_max	=> timer_max,
			result		=> trigger
		);
	
	process (clk)
	begin if (trigger = '1') then
		start_message <= start_message - 1;
	end if;
	if (acel = '1') then
		timer_max <= timer_max - clock_freq * interval;
	elsif (decel = '1') then
		timer_max <= timer_max + clock_freq * interval;
	end if;
	end process;

end Behavioral;


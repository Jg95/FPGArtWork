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
		clock_freq	: integer := 50000000;
		interval		: integer := 25
	);
	port(
		reset				: in std_logic;							--reset
		clk				: in std_logic;							--reloj
		acel				: in std_logic;							--boton de aceleracion
		decel				: in std_logic;							--boton de deceleracion
		mode				: in std_logic;
		global_message	: in string(11 downto 1);
		changing_message	: in string (4 downto 1);
		digit				: out std_logic_vector(3 downto 0);	--seleccion del display
		segment			: out std_logic_vector(6 downto 0)	--seleccion de segmentos
	);
end message_bus;

architecture Behavioral of message_bus is
	
	component multi_display is
		port(
			reset		: in std_logic;							--reset
			clk		: in std_logic;							--reloj
			message	: in string(4 downto 1);				--mensaje enviado
			digit		: out std_logic_vector(3 downto 0);	--seleccion de display
			segment	: out std_logic_vector(6 downto 0)	--seleccion de segmentos
		);
	end component;
	
	component counter is
		port(
			reset			: in std_logic;	--reset
			clk			: in std_logic;	--reloj
			count_max	: in integer;		--end of the counter
			result		: out std_logic	--'1' if the counter has ended
		);
	end component;
		
	signal start_message: integer := 11; --Indice de inicio mostrado de global message
	signal message_to_send: string(4 downto 1);
	signal timer_max: integer := clock_freq / 10000000; --Para simulaciones usar clock_freq / 10000000
	signal trigger: std_logic := '0';
	signal prev_acel: std_logic := '0';
	signal prev_decel: std_logic := '0';
	
begin	
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
	
	process (clk, reset)
	begin 
		if (reset = '1') then
			start_message <= 11;
			timer_max <= clock_freq / 10000000;
		elsif clk'event and clk = '1' then
			if (mode = '0') then
				message_to_send <= global_message(start_message downto start_message - 3);
				if (trigger /= '0') then --trigger es 'x' en lugar de '1'
					if (start_message - 3 = 1) then
						start_message <= 11;
					else
						start_message <= start_message - 1;
					end if;
				end if;
				if (acel = '1') then
					if prev_acel = '0' and timer_max /= clock_freq * interval / 100 then
						timer_max <= timer_max - clock_freq * interval / 100; --Para simulaciones usar clock_freq / 10000000
					end if;
				elsif (decel = '1') then
					if prev_decel = '0' then
						timer_max <= timer_max + clock_freq * interval / 100; --Para simulaciones usar clock_freq / 10000000
					end if;
				end if;
				prev_acel <= acel;
				prev_decel <= decel;
			else
				message_to_send <= changing_message;
			end if;
		end if;
	end process;

end Behavioral;
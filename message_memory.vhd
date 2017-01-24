----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:14:09 01/19/2017 
-- Design Name: 
-- Module Name:    message_memory - Behavioral 
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

entity message_memory is
	port(
		reset				: in std_logic;
		clk				: in std_logic;
		acel				: in std_logic;
		decel				: in std_logic;
		m_selec			: in std_logic_vector(2 downto 0);
		mode				: in std_logic;
		selec				: in std_logic;
		digit				: out std_logic_vector(3 downto 0);
		segment			: out std_logic_vector(6 downto 0)
	);
end message_memory;

architecture Behavioral of message_memory is

	component message_bus is
		port(
			reset				: in std_logic;							--reset
			clk				: in std_logic;							--reloj
			acel				: in std_logic;							--boton de aceleracion
			decel				: in std_logic;							--boton de deceleracion
			mode				: in std_logic;
			global_message	: in string(11 downto 1);
			changing_message : in string (4 downto 1);
			digit				: out std_logic_vector(3 downto 0);	--seleccion del display
			segment			: out std_logic_vector(6 downto 0)	--seleccion de segmentos
		);
	end component;
	
	component message_writer is
		port(
			clk : in std_logic;
			reset : in std_logic;
			plus : in std_logic;
			minus : in std_logic;
			mode : in std_logic;
			output : out character
			);
	end component;
	
	signal message_changing : string (4 downto 1) := "    ";
	signal message : string (11 downto 1) := "ENTER MSG  ";
	signal message0 : string (11 downto 1) := "FPGARTWORK ";
	signal message2 : string (11 downto 1) := "ENTER MSG  ";
	signal message3 : string (11 downto 1) := "ME ALEGRO  ";
	signal message4 : string (11 downto 1) := "HOLA LUIS  ";
	signal message5 : string (11 downto 1) := "ENTER MSG  ";
	signal message6 : string (11 downto 1) := "QUE TAL?   ";
	signal message7 : string (11 downto 1) := "TODO BIEN? ";
	
	signal change_leter : character := 'A';
	signal index : integer := 4;
	signal msg_index : integer := 11;
	
	signal prev_selec : std_logic := '0';
	signal prev_mode : std_logic := '0';

begin

	message_to_print: message_bus			--logica del mensaje
		port map (
			reset 			=> reset,
			clk				=> clk,
			acel				=> acel,
			decel				=> decel,
			mode				=> mode,
			global_message	=> message,
			changing_message => message_changing,
			digit 			=> digit,
			segment 			=> segment
		);
		
	message_modifier: message_writer
		port map(
			clk => clk,
			reset => reset,
			plus => acel,
			minus => decel,
			mode => mode,
			output => change_leter
		);

process(clk, reset)
begin
	if (reset = '1') then
		index <= 4;
		msg_index <= 11;
		message0 <= "FPGARTWORK ";
		message2 <= "ENTER MSG  ";
		message3 <= "ME ALEGRO  ";
		message4 <= "HOLA LUIS  ";
		message5 <= "ENTER MSG  ";
		message6 <= "QUE TAL?   ";
		message7 <= "TODO BIEN? ";
	elsif clk'event and clk = '1' then
		case m_selec is 		
			when "000" => message <= message0;
			when "010" => message <= message2;
			when "011" => message <= message3;
			when "100" => message <= message4;
			when "101" => message <= message5;
			when "110" => message <= message6;
			when others => message <= message7;
		end case;
		
		if mode = '1' then
			if prev_mode = '0' then
				index <= 4;
				msg_index <= 11;
			end if;
			message_changing(index) <= change_leter;
			
			if selec = '1' and prev_selec = '0' then
				if index > 1 then
					index <= index - 1;
				end if;
				if msg_index > 1 then
					msg_index <= msg_index - 1;
					case m_selec is 		
						when "000" => message0(msg_index) <= change_leter;
							message_changing(4 downto index + 1) <= message0(msg_index + 4 - index downto msg_index + 1);						
						when "010" => message2(msg_index) <= change_leter;
							message_changing(4 downto index + 1) <= message2(msg_index + 4 - index downto msg_index + 1);
						when "011" => message3(msg_index) <= change_leter;
							message_changing(4 downto index + 1) <= message3(msg_index + 4 - index downto msg_index + 1);
						when "100" => message4(msg_index) <= change_leter;
							message_changing(4 downto index + 1) <= message4(msg_index + 4 - index downto msg_index + 1);
						when "101" => message5(msg_index) <= change_leter;
							message_changing(4 downto index + 1) <= message5(msg_index + 4 - index downto msg_index + 1);
						when "110" => message6(msg_index) <= change_leter;
							message_changing(4 downto index + 1) <= message6(msg_index + 4 - index downto msg_index + 1);
						when others => message7(msg_index) <= change_leter;
							message_changing(4 downto index + 1) <= message7(msg_index + 4 - index downto msg_index + 1);
					end case;						
				end if;
				
				
			end if;
		elsif mode = '0' and prev_mode = '1' then
			case m_selec is 		
				when "000" => message0(msg_index downto 1) <= (others => ' ');
				when "010" => message2(msg_index downto 1) <= (others => ' ');
				when "011" => message3(msg_index downto 1) <= (others => ' ');
				when "100" => message4(msg_index downto 1) <= (others => ' ');
				when "101" => message5(msg_index downto 1) <= (others => ' ');
				when "110" => message6(msg_index downto 1) <= (others => ' ');
				when others => message7(msg_index downto 1) <= (others => ' ');
			end case;
			message_changing <= "    ";
		end if;
		prev_mode <= mode;
		prev_selec <= selec;
	end if;
	
end process;

end Behavioral;


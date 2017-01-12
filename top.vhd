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
		clock_freq: integer := 50000000					-- para ajustar la frecuencia de simulacion
	);
	port (
		reset  : in  std_logic;								-- Reset de la entidad superior
		clk_in : in  std_logic;								-- reloj de la entidad top
		acel   : in  std_logic;								-- boton de aceleracion
		decel  : in  std_logic;								-- boton de deceleracion
		digit  : out std_logic_vector ( 3 downto 0);	-- seleccion de display
		segment: out std_logic_vector ( 7 downto 0)  -- seleccion de segmento
	);
end top;

architecture behavioral of top is	-- entidad para acondicionar las entradas d elos botones (sincronia y rebotes)

	component but_acond is
		port (
			reset  : in  std_logic;		-- reset del acondicionamiento
			clk_in : in  std_logic;		-- reloj del acondicionamiento
         but_in : in  std_logic;		-- boton a acondicionar
         but_out: out std_logic		-- boton acondicionado
		);
	end component;
  
   signal  acel_out: std_logic;
   signal decel_out: std_logic;
	
	
	component message_bus is
		port(
			reset		: in std_logic;							--reset
			clk		: in std_logic;							--reloj
			acel		: in std_logic;							--boton de aceleracion
			decel		: in std_logic;							--boton de deceleracion
			digit		: out std_logic_vector(3 downto 0);	--seleccion del display
			segment	: out std_logic_vector(7 downto 0)	--seleccion de segmentos
		);
	end component;
begin

	acel_acond: but_acond			--acondicionamientgo de aceleracion
		port map (
			reset   => reset,
			clk_in  => clk_in,
         but_in  => acel,
         but_out => acel_out
		);

	decel_acond: but_acond			--acondicionamiento de deceleracion
		port map (
			reset   => reset,
			clk_in  => clk_in,
         but_in  => decel,
         but_out => decel_out
		);
		
	message: message_bus			--logica del mensaje
		port map (
			reset => reset,
			clk	=> clk_in,
			acel	=> acel_out,
			decel	=> decel_out,
			digit => digit,
			segment => segment
		);

end behavioral;

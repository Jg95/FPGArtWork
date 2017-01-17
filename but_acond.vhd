----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:10:57 12/13/2016 
-- Design Name: 
-- Module Name:    but_acond - Behavioral 
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity but_acond is
	generic(
		counter_size  :  integer := 19); --counter size (19 bits gives 10.5ms with 50MHz clock)
	port (
		reset  : in  std_logic;		-- reset del acondicionamiento
		clk_in : in  std_logic;		-- reloj del acondicionamiento
		but_in : in  std_logic;		-- boton a acondicionar
		but_out: out std_logic		-- boton acondicionado
	);
end but_acond;

architecture Behavioral of but_acond is
	signal flipflops   : STD_LOGIC_VECTOR(1 downto 0); --input flip flops
	signal counter_set : STD_LOGIC;                    --sync reset to zero
	signal counter_out : STD_LOGIC_VECTOR(counter_size downto 0) := (others => '0'); --counter output
begin

	counter_set <= flipflops(0) xor flipflops(1);   --determine when to start/reset counter
  
	process(clk_in, reset)
	begin
		if (reset = '1') then
			counter_out <= (others => '0');
			flipflops <= (others => '0');
		elsif(clk_in'EVENT and clk_in = '1') then
			flipflops(0) <= but_in;
			flipflops(1) <= flipflops(0);
			if(counter_set = '1') then                  --reset counter because input is changing
				counter_out <= (others => '0');
			elsif(counter_out(counter_size) = '0') then --stable input time is not yet met
				counter_out <= counter_out + 1;
			else                                        --stable input time is met
				but_out <= flipflops(1);
			end if;    
		end if;
	end process;
end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:05 12/13/2016 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
	port(
		reset			: in std_logic;
		clk			: in std_logic;
		count_max	: in integer;
		result		: out std_logic
	);
end counter;

architecture Behavioral of counter is

	signal count: integer := 0;
	signal reset_result: std_logic := '0';

begin

	process(clk, reset)
	begin
		if (reset = '1') then
			count <= 0;
			reset_result <= '0';
		elsif (clk'event) and (clk = '1') then
			if (count_max > 0) then
				count <= count + 1;
				if (reset_result = '1') then
					reset_result <= '0';
				elsif (count >= count_max) then
					count <= 0;
					reset_result <= '1';
				end if;
			end if;
			result <= reset_result;
		end if;
	end process;

end Behavioral;


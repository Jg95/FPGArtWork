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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity but_acond is
	port (
		reset  : in  std_logic;		-- reset del acondicionamiento
		clk_in : in  std_logic;		-- reloj del acondicionamiento
		but_in : in  std_logic;		-- boton a acondicionar
		but_out: out std_logic		-- boton acondicionado
	);
end but_acond;

architecture Behavioral of but_acond is

begin


end Behavioral;


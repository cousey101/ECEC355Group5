library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUXInvert is
	port(	x: in std_logic; 
			z: out std_logic; 
			s: in std_logic);
end MUXInvert;

architecture Behavioral of MUXInvert is
signal temp : std_logic;
begin

process(x, s)
begin
if s = '0' then
	temp <= x;
else
	temp <= (not x);
end if;
end process;
z <= temp;
end Behavioral;
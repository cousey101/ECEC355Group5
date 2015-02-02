library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX2 is
	generic (m : natural := 1;
	port(	x: in std_logic_vector(0 to 2**m - 1); 
			z: out std_logic; 
			s: in std_logic_vector(m-1 downto 0));
end MUX2;

architecture Behavioral of MUX2 is

begin

process(x)
variable temp : integer;
begin
temp := 0;
for i in 0 to m-1 loop 
	if s(i) = '1' then 
		temp := temp + 2**i;
	end if;
end loop;
z <= x(temp);
end process;

end Behavioral;
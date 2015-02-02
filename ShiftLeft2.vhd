

library ieee;
use IEEE.std_logic_1164.all;

entity ShiftLeft2 is
	port(x:in std_logic_vector(31 downto 0);
	     y:out std_logic_vector(31 downto 0));
end ShiftLeft2;

architecture ShLf2 of ShiftLeft2 is
	signal temp : bit_vector (31 downto 0);
	signal temp1 : bit_vector (31 downto 0);
begin
	temp <= to_bitvector(x);
	temp1 <= temp sll 2;
	y <= to_stdlogicvector(temp1);

end ShLf2;

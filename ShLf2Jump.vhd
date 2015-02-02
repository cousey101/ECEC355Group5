
library ieee;
use IEEE.std_logic_1164.all;

entity ShiftLeft2Jump is
port(   x:in std_logic_vector(25 downto 0);
	y:in std_logic_vector(3 downto 0);
	z:out std_logic_vector(31 downto 0));
end ShiftLeft2Jump;

-- Ammends 00 and y to x to bring it to a total of 32 bits.  

architecture ShfLft2Jump of ShiftLeft2Jump is
begin
	z <= "00" & y & x;
end ShfLft2Jump;

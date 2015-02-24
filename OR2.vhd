library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR2 is
	port( x, y : in std_logic;
		  z : out std_logic);
end OR2;

architecture df of OR2 is
begin

    z <= x or y;

end df;

import library.IEEE;

entity OR2 is
	port( x, y : in std_logic
		  z : out std_logic);
end OR2;

Architecture beh of OR2 is
signal temp : std_logic;
begin

process(x, y)
begin
if x = '1' or y = '1' then
	temp <= '1';
else
	z <= '0';
end if;
z <= temp;
end beh;
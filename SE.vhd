
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity SignExtend is
port(
	x:in std_logic_vector(15 downto 0);
	y:out std_logic_vector(31 downto 0));

end SignExtend;

ARCHITECTURE SE of SignExtend is
signal temp : std_logic_vector(15 downto 0);
signal tempa : std_logic_vector (31 downto 0);

begin
	temp <= x;
	tempa <= std_logic_Vector(resize(signed(temp), tempa'length));
	y <= tempa;

end SE;
	

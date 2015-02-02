LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity ALU1b is
port(
	a,b,aInv,bInv,oper,less,cIn:in std_logic_vector(1 downto 0);
	result,cOut:out std_logic_vector(1 downto 0));
  
end ALU1b;

ARCHITECTURE beh of ALU1b is
begin
end beh;
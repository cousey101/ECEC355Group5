
library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PC is
port(clk:in std_logic;
     AddressIn:in std_logic_vector(31 downto 0);
     AddressOut:out std_logic_vector(31 downto 0));
end PC;

architecture ProgramCounter of PC is
signal temp : std_logic_vector(31 downto 0);
begin
process(clk)
begin
	temp <= AddressIn;
	AddressOut <= std_logic_vector(to_unsigned(to_integer(unsigned( temp )) + 1, 32));
End Process;
end ProgramCounter;
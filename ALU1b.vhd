LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity ALU1b is
port(
	a,b,aInv,bInv,less,cIn:in STD_LOGIC;
	oper: in STD_LOGIC_VECTOR(1 downto 0);
	result,cOut:out STD_LOGIC );
end ALU1b;

ARCHITECTURE beh of ALU1b is
  component ADD1b is
		port(	A, B, cIn:in STD_LOGIC;
				  Sum, cO :out STD_LOGIC );
	end component;
	component muxAinv is
		port(	x : in STD_LOGIC_VECTOR(1 downto 0);
				  s : in STD_LOGIC;
				  y : out STD_LOGIC );
	end component;
	component muxBinv is
		port(	x : in STD_LOGIC_VECTOR(1 downto 0);
				  s : in STD_LOGIC;
				  y : out STD_LOGIC );
	end component;
	component muxOper is
		port(	x : in STD_LOGIC_VECTOR(3 downto 0);
		      s : in STD_LOGIC_VECTOR(1 downto 0);
				  y : out STD_LOGIC );
	end component;
	signal Sum:STD_LOGIC;
	signal sumCOut:STD_LOGIC;
begin  
  ADD:ADD1b port map(A,B,Sum,sumCOut);
end beh;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


entity DataMemory is
	port(	WriteData			:in STD_LOGIC_VECTOR(31 downto 0);
	     	Address  			:in STD_LOGIC_VECTOR(31 downto 0);
	     	MemRead, MemWrite, Clk 		:in STD_LOGIC;
		ReadData			:out STD_LOGIC_VECTOR(31 downto 0));
end DataMemory;

architecture behav of DataMemory is
	type Memory is array(0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
	signal MemoryArray : Memory;
begin
	DataMemProc:process(CLK,MemRead,MemWrite,WriteData)
	variable i:integer;
	variable first:boolean:=true;
	begin
	
		if (first) then
			MemoryArray(0) <= "00000000";
			MemoryArray(1) <= "00000000";
			MemoryArray(2) <= "00000000";
			MemoryArray(3) <= "00000100";

			MemoryArray(4) <= "00000000";
			MemoryArray(5) <= "00000000";
			MemoryArray(6) <= "00000000";
			MemoryArray(7) <= "00000100";

			first:=false;
		end if;
	if CLK='1' and CLK'event then
		i:=conv_integer(unsigned(Address));
		if MemWrite='1' and MemRead='0' then
			MemoryArray(i)<=WriteData(31 downto 24);
			MemoryArray(i+1)<=WriteData(23 downto 16);
			MemoryArray(i+2)<=WriteData(15 downto 8);
			MemoryArray(i+3)<=WriteData(7 downto 0);
		end if;
	end if;

	if CLK='0' and CLK'event then
		i:=conv_integer(unsigned(Address));
		if MemRead='1' and MemWrite='0' then
			ReadData<=MemoryArray(i) & MemoryArray(i+1) & MemoryArray(i+2) & MemoryArray(i+3);
		end if;
	end if;

	end process DataMemProc;
end behav;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity ALUControl is
	port(	ALUOp : in std_logic_vector(1 downto 0);
			ALUfunct : in std_logic_vector(5 downto 0);
			ALUCtr : out std_logic_vector(3 downto 0));
	end ALUControl;

Architecture struc of ALUControl is
begin

process(ALUop)
begin
case ALUOp is
	when "00" => ALUCtr <= "0010";
	when "01" => ALUCtr <= "0110";
	when "10" => 
		if ALUfunct = "100000" then
			ALUCtr <= "0010";
		elsif ALUfunct = "100010" then
			ALUCtr <= "0110";
		elsif ALUfunct = "100100" then
			ALUCtr <= "0000";
		elsif ALUfunct = "100101" then
			ALUCtr <= "0001";
		elsif ALUfunct = "101010" then
			ALUCtr <= "0111";
		else
			ALUCtr <= "UUUU";
		end if;
	when others => ALUCtr <= "UUUU";
end case;

end process;

end struc;
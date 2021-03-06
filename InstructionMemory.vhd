--Basically you create an array of all the instructions. divided into groups of 1 instruction ( 32 bits )
--the instructions are further subdivided into 4 groups for readabilitiy.
--the address is coverted to an integer at the end and points to a location in the array of instructions.
--the read data vector is built from the position of r to r+3 (that's 32 bits)
--edit the instructions hardcoded into this vhd file to change the behavior (it doesn't read from some text file or w/e) 
--check the test vectors the teacher wants to  give us against the memArray instructions first to see if it needs to be modified.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
entity InstructionMemory is
port(Address:in std_logic_vector(31 downto 0);
	ReadData:out std_logic_vector(31 downto 0));
end InstructionMemory;
architecture Behavioral of InstructionMemory is
type mem is array(0 to 256) of std_logic_vector(7 downto 0);
signal memArray:mem;
begin
P1:process(Address)
variable r:integer;
variable first:boolean:=true;
begin
if(first) then
-- lw $s0,0($t0) Memory Starts at 40 so 40($t0)
memArray(0)<="10001101";
memArray(1)<="00010000";
memArray(2)<="00000000";
memArray(3)<="00000000";
-- lw $s1,4($t0)
memArray(4)<="10001101";
memArray(5)<="00010001";
memArray(6)<="00000000";
memArray(7)<="00000100";
-- beq $s0,$s1,L
memArray(8)<="00010010";
memArray(9)<="00010001";
memArray(10)<="00000000";
memArray(11)<="00000010";
-- add $s3,$s4,$s5
memArray(12)<="00000010";
memArray(13)<="10010101";
memArray(14)<="10011000";
memArray(15)<="00100000";
-- j exit
memArray(16)<="00001000";
memArray(17)<="00000000";
memArray(18)<="00000000";
memArray(19)<="00000110";
-- L: sub $s3,$s4,$s5
memArray(20)<="00000010";
memArray(21)<="10010101";
memArray(22)<="10011000";
memArray(23)<="00100010";
-- exit: sw $s3,8($t0)
memArray(24)<="10101101";
memArray(25)<="00010011";
memArray(26)<="00000000";
memArray(27)<="00001000";
first:=false;
end if;
r:=conv_integer(unsigned(Address));
ReadData<=memArray(r) & memArray(r+1) & memArray(r+2) & memArray(r+3);
end process P1;
end Behavioral;
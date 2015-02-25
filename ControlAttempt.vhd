LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity Control is
	port(	OpCode : in std_logic_vector(31 downto 26);
			RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite : out std_logic
			ALUOp : out std_logic_vector(1 downto 0));
end Control;

Architecture struc of Control is
begin

if Opcode="000000" then --R
    RegDst <= '1';
    ALUSrc <= '0';
    MemtoReg <= '0';
    RegWrite <= '1';
    MemRead <= '0';
    MemWrite <= '0';
    Branch <= '0';
    ALUOp(1) <= '1';
    ALUOP(0) <= '0';
    Jump <= '0';
  elsif Opcode="100011" then -- lw
    RegDst <= '0';
    ALUSrc <= '1';
    MemtoReg <= '1';
    RegWrite <= '1';
    MemRead <= '1';
    MemWrite <= '0';
    Branch <= '0';
    ALUOp(1) <= '0';
    ALUOP(0) <= '0';
    Jump <= '0';
  elsif Opcode="101011" then -- sw
    RegDst <= 'U';
    ALUSrc <= '1';
    MemtoReg <= 'U'; 
    RegWrite <= '0';
    MemRead <= '0';
    MemWrite <= '1';
    Branch <= '0';
    ALUOp(1) <= '0';
    ALUOP(0) <= '0';
    Jump <= '0';
  elsif Opcode="000100" then --beq
    RegDst <= 'U';
    ALUSrc <= '0';
    MemtoReg <= 'U';
    RegWrite <= '0';
    MemRead <= '0';
    MemWrite <= '0';
    Branch <= '1';
    ALUOp(1) <= '0';
    ALUOP(0) <= '1';
    Jump <= '0';
  elsif Opcode="000010" then
    RegDst <= 'U';
    ALUSrc <= 'U';
    MemtoReg <= 'U';
    RegWrite <= '0';
    MemRead <= '0';
    MemWrite <= '0';
    Branch <= '0';
    ALUOp(1) <= 'U';
    ALUOP(0) <= 'U';
    Jump <= '1';
  else
    --Do nothing
  end if;
end process;

end struc;
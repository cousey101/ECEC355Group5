library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity ALU32b is
    port (
            oper: in std_logic_vector (3 downto 0); -- ainv, bneg, oper(1), oper(2)
            a, b: in STD_LOGIC_VECTOR(31 downto 0);
            result: out STD_LOGIC_VECTOR(31 downto 0);
            overflow, zero: out STD_LOGIC);
    end ALU32b;

architecture struc of ALU32b is
    component ALU1b is
        port (
            oper: in std_logic_vector (3 downto 0);
            a, b, cin, less: in STD_LOGIC;
            result, cout, set: out STD_LOGIC);
        end component;
    
    component NOR1b is
        port ( a, b : in std_logic;
            c: out std_logic);
    end component;

    signal couts : STD_LOGIC_VECTOR (31 downto 0);
    signal set : STD_LOGIC_VECTOR (31 downto 0);
    signal temp_result : std_logic_vector (31 downto 0);
    signal nor_collect : std_logic_vector (31 downto 0);
begin

    ALUn: ALU1b port map (oper, a(0), b(0), oper(2), set(31), temp_result(0), couts(0), set(0));
    
    G1: for i in 1 to 30 generate
        alui: ALU1b port map (oper, a(i), b(i), couts(i-1), '0', temp_result(i), couts(i), set(i));  
    end generate G1;

    ALUlast: ALU1b port map (oper, a(31), b(31), couts(30), '0', temp_result(31), couts(31), set(31));
    
    nor_collect(0) <= temp_result(0) nor temp_result(1);
    H1: for i in 2 to 31 generate
        ZeroNor: NOR1b port map ( nor_collect(i - 2), temp_result(i), nor_collect(i - 1));
    end generate H1;

    zero <= nor_collect (30);
    result <= temp_result;
    overflow <= couts(31) xor couts(30);

end struc;

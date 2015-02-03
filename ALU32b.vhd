library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity ALU32b is
    port (
        ainv, binv, cin: in STD_LOGIC;
        oper: in STD_LOGIC_VECTOR(1 DOWNTO 0);
        result: out STD_LOGIC_VECTOR(31 downto 0);
        overflow: out STD_LOGIC);
end ALU32b;

architecture struc of ALU32b is
    component ALU1b is
        port ( 
            a, b, ainv, binv, less, cin: in STD_LOGIC;
            oper: in STD_LOGIC_VECTOR(1 downto 0);
            result, cout: out STD_LOGIC);
    end component;

begin


end struc;
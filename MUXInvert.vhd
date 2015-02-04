library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUXInvert is
        port(   x: in std_logic; 
                    z: out std_logic; 
                    s: in std_logic);
    end MUXInvert;

architecture Behavioral of MUXInvert is
begin

    z <= x xor s;

end Behavioral;


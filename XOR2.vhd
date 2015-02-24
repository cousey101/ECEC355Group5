library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity XOR2 is
        port(   x: in std_logic; 
                y: in std_logic; 
                z: out std_logic);
 end XOR2;

architecture df of XOR2 is
begin

    z <= x xor y;

end df;


library ieee;
use ieee.std_logic_1164.all;

entity NOR1b is
    port ( a, b : in std_logic;
        c : out std_logic);
end NOR1b;

architecture df of NOR1b is
begin
    c <= a nor b;
end df;

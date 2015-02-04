brary IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX3 is
        generic (m : natural := 2);
            port(   x: in std_logic_vector(2**m - 1 downto 0); 
                    z: out std_logic; 
                        s: in std_logic_vector(m-1 downto 0));
                    end MUX3;

architecture Behavioral of MUX3 is

begin

    process(x,s)
        variable temp : integer;
    begin
    temp := 0;
    for i in 0 to m-1 loop 
        if s(i) = '1' then 
            temp := temp + 2**i;
        end if;
    end loop;
    z <= x(temp);
end process;

end Behavioral;

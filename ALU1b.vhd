LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity ALU1b is
        port(
            oper : in std_logic_vector(3 downto 0); -- ainv, bneg, oper(1), oper(0)
            a, b, cin, less: in std_logic;
            result, cout, set : out std_logic );
    end ALU1b;

ARCHITECTURE beh of ALU1b is
        signal ainv_out, binv_out : std_logic;
            signal muxin : std_logic_vector(3 downto 0);
                component XOR2 is
                    port(   x: in std_logic;  
                            y: in std_logic;
                            z: out std_logic);
                    end component;
                component ADD1b is
                    port( A, B, cIn : in  STD_LOGIC;
                        Sum, cOut : out STD_LOGIC );
                end component;
                component MUX3 is
                    generic (m : natural := 2);
                    port(   x: in std_logic_vector(2**m - 1 downto 0); 
                        z: out std_logic; 
                        s: in std_logic_vector(m-1 downto 0));
                end component;

                component OR2 is
                    port( x, y : in std_logic;
                        z : out std_logic);
                end component;
                component AND2 is
                    port( x, y : in std_logic;
                        z : out std_logic);
                end component;

begin
    muxin(3) <= less;
    Ainv : XOR2 port map(a, oper(3), ainv_out); 
    Binv : XOR2 port map(b, oper(2), binv_out);
    Muxin0  : AND2 port map (ainv_out, binv_out, muxin(0));
    Muxin1  : OR2 port map(ainv_out, binv_out, muxin(1));
    Muxin2  : ADD1b port map(ainv_out, binv_out, cin, muxin(2), cout);
    OperMUX : MUX3 port map(muxin, result, oper(1 downto 0));
                                        
    set<= muxin(2);
end beh;

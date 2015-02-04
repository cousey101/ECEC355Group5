LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity ALU1b is
    port(
    a,b,aInv,bInv,less,cIn:in STD_LOGIC;
    oper: in STD_LOGIC_VECTOR(1 downto 0);
    result, cOut, set :out STD_LOGIC );
end ALU1b;

ARCHITECTURE beh of ALU1b is
    signal ainv_out, binv_out : std_logic;
    signal muxin : std_logic_vector(3 downto 0);
    component MUXInvert is
        port(   x: in std_logic;  
        s: in std_logic;
        z: out std_logic);
    end component;
    component ADD1b is
        port( A, B, cIn : in  STD_LOGIC;
                      Sum, cOut : out STD_LOGIC );
          end component;
        component MUX3 is
            generic (m : natural := 2);
            port(   x: in std_logic_vector(0 to 2**m - 1); 
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
    g0 : for j in 0 downto 0 generate
        muxin(3) <= less;
        MuxAinv : MUXInvert port map(a, ainv, ainv_out); 
        MuxBinv : MUXInvert port map(b, binv, binv_out);
        Muxin0  : AND2 port map (ainv_out, binv_out, muxin(0));
        Muxin1  : AND2 port map(ainv_out, binv_out, muxin(1));
        ADDER   : ADD1b port map(ainv_out, binv_out, cIn, muxin(2), COut);
        OpperMUX: MUX3 port map(muxin, result, oper);
    end generate g0;
                
    set<= muxin(2);
end beh;

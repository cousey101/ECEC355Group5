LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity 1bADD is
        port( A, B, cIn         : in  STD_LOGIC;
              Sum, cOut         : out STD_LOGIC );
end 1bADD;

architecture beh of 1bADD is
begin
        sum <=  (not a and not b and cin) or
                        (not a and b and not cin) or
                        (a and not b and not cin) or
                        (a and b and cin);
        cout <= (not a and b and cin) or
                        (a and not b and cin) or
                        (a and b and not cin) or
                        (a and b and cin);
end beh;
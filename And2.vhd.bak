Library.IEEE;

entity AND2 is
  port( x, y : in std_logic;
        z : out std_logic);
end AND2;

Architecture beh of AND2 is
begin
process(x, y)
begin
  if x = '1' and y = '1' then 
    z <= '1';
  else
    z <= '0';
  end if;
end process;

end beh;
entity SLT is
    port( a, b: in STD_LOGIC 
        less_than: out STD_LOGIC);
end SLT;

architecture df of SLT is
begin
    less_than <= ((a xor b) and b)
end df;

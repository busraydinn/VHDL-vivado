library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 --- 2 giriş XOR =Toplam
 --- 2 giriş AND= Elde

entity HalfAdder is
  Port (
    A,B:in std_logic;
    Sum:out std_logic;
    Carry: out std_logic
   );
end HalfAdder;

architecture Behavioral of HalfAdder is

begin
    Sum<= A xor B;
    Carry<=A and B;

end Behavioral;

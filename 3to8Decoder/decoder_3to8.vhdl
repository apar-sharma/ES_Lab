library ieee;
use ieee.std_logic_1164.all;

entity decoder_3to8 is
    port (
        A, B, C: in std_logic;
        Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7: out std_logic
    );
end entity decoder_3to8;

architecture behavioral of decoder_3to8 is
begin
    Y0 <= (not A) and (not B) and (not C);
    Y1 <= (not A) and (not B) and C;
    Y2 <= (not A) and B and (not C);
    Y3 <= (not A) and B and C;
    Y4 <= A and (not B) and (not C);
    Y5 <= A and (not B) and C;
    Y6 <= A and B and (not C);
    Y7 <= A and B and C;
end architecture behavioral;

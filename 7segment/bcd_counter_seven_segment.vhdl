library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_counter_seven_segment is
    port (
        clk: in std_logic;
        rst: in std_logic;
        seven_segment_out: out std_logic_vector(6 downto 0)
    );
end entity bcd_counter_seven_segment;

architecture behavioral of bcd_counter_seven_segment is
    signal counter: unsigned(13 downto 0) := (others => '0');
    signal bcd_out: std_logic_vector(3 downto 0);
    signal segment_data: std_logic_vector(6 downto 0);
begin
    process(clk, rst)
    begin
        if rst = '1' then
            counter <= (others => '0');
        elsif rising_edge(clk) then
            if counter = to_unsigned(9999, counter'length) then
                counter <= (others => '0');
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    bcd_out <= std_logic_vector(to_unsigned(to_integer(counter), bcd_out'length));

    process(bcd_out)
    begin
        case bcd_out is
            when "0000" =>
                segment_data <= "0000001"; -- Display 0
            when "0001" =>
                segment_data <= "1001111"; -- Display 1
            when "0010" =>
                segment_data <= "0010010"; -- Display 2
            when "0011" =>
                segment_data <= "0000110"; -- Display 3
            when "0100" =>
                segment_data <= "1001100"; -- Display 4
            when "0101" =>
                segment_data <= "0100100"; -- Display 5
            when "0110" =>
                segment_data <= "0100000"; -- Display 6
            when "0111" =>
                segment_data <= "0001111"; -- Display 7
            when "1000" =>
                segment_data <= "0000000"; -- Display 8
            when others =>
                segment_data <= "0001000"; -- Display blank
        end case;
    end process;

    seven_segment_out <= segment_data;
end architecture behavioral;

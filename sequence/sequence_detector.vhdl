library ieee;
use ieee.std_logic_1164.all;

entity sequence_detector is
    port (
        clk, reset: in std_logic;
        input_bit: in std_logic;
        sequence_detected: out std_logic
    );
end entity sequence_detector;

architecture behavioral of sequence_detector is
    type state_type is (IDLE, S1, S2, S3, DETECTED);
    signal state: state_type := IDLE;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            state <= IDLE;
            sequence_detected <= '0';
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    if input_bit = '1' then
                        state <= S1;
                    else
                        state <= IDLE;
                    end if;
                when S1 =>
                    if input_bit = '0' then
                        state <= IDLE;
                    else
                        state <= S2;
                    end if;
                when S2 =>
                    if input_bit = '1' then
                        state <= S3;
                    else
                        state <= IDLE;
                    end if;
                when S3 =>
                    if input_bit = '1' then
                        state <= DETECTED;
                    else
                        state <= IDLE;
                    end if;
                when DETECTED =>
                    if input_bit = '0' then
                        state <= IDLE;
                    else
                        state <= DETECTED;
                    end if;
            end case;
        end if;
    end process;

    sequence_detected <= '1' when state = DETECTED else '0';
end architecture behavioral;

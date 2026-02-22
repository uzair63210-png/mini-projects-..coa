library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter_4bit_updown_hold is
    port (
        clk       : in  std_logic;
        hold      : in  std_logic;                    -- 1 = hold, 0 = count
        up_down   : in  std_logic;                    -- 1 = count up, 0 = count down
        q         : out std_logic_vector(3 downto 0)
    );
end entity;

architecture rtl of counter_4bit_updown_hold is
    signal count : unsigned(3 downto 0);
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if hold = '0' then
                if up_down = '1' then
                    count <= count + 1;
                else
                    count <= count - 1;
                end if;
            end if;
            -- when hold = '1' → count is not changed (register keeps value)
        end if;
    end process;

    q <= std_logic_vector(count);

end architecture rtl;
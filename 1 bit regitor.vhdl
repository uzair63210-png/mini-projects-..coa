LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity MUX_GATE_1 is
  port (
    p_out: out std_logic;
    sel: in std_logic;
    
    in_0: in std_logic;
    in_1: in std_logic );
end MUX_GATE_1;

architecture Behavioral of MUX_GATE_1 is
begin
  with sel select
    p_out <=
      in_0 when '0',
      in_1 when '1',
      '0' when others;
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity DIG_D_FF is
  generic (
    Default: std_logic ); 
  port ( D  : in std_logic;
         C  : in std_logic;
         Q  : out std_logic;
         notQ : out std_logic );
end DIG_D_FF;

architecture Behavioral of DIG_D_FF is
   signal state : std_logic := Default;
begin
   Q    <= state;
   notQ <= NOT( state );

   process(C)
   begin
      if rising_edge(C) then
        state  <= D;
      end if;
   end process;
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity main is
  port (
    p_in: in std_logic;
    CLK: in std_logic;
    L: in std_logic;
    onotp: out std_logic);
end main;

architecture Behavioral of main is
  signal s0: std_logic;
  signal onotp_temp: std_logic;
begin
  gate0: entity work.MUX_GATE_1
    port map (
      sel => L,
      in_0 => onotp_temp,
      in_1 => p_in,
      p_out => s0);
  gate1: entity work.DIG_D_FF
    generic map (
      Default => '0')
    port map (
      D => s0,
      C => CLK,
      Q => onotp_temp);
  onotp <= onotp_temp;
end Behavioral;

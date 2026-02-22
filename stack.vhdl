
library IEEE;
use IEEE.std_logic_1164.all;

entity T_FF is
    port (
        T    : in  std_logic;
        clk  : in  std_logic;
        Q    : out std_logic;
        Qn   : out std_logic
    );
end entity;

architecture behave of T_FF is
    signal q_reg : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if T = '1' then
                q_reg <= not q_reg;
            end if;
        end if;
    end process;

    Q  <= q_reg;
    Qn <= not q_reg;
end architecture;


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
USE ieee.numeric_std.all;

entity counter_up_and_down is
  port (
    clk: in std_logic;
    up_notdown: in std_logic;
    hold: in std_logic;
    op: out std_logic_vector(3 downto 0));
end counter_up_and_down;

architecture Behavioral of counter_up_and_down is
  signal s0: std_logic;
  signal s1: std_logic;
  signal s2: std_logic;
  signal s3: std_logic;
  signal s4: std_logic;
  signal s5: std_logic;
  signal s6: std_logic;
  signal s7: std_logic;
  signal s8: std_logic;
  signal s9: std_logic;
begin
  gate0: entity work.T_FF -- T_FF
    port map (
      T => hold,
      clk => clk,
      Q => s1,
      Qn => s0);
  gate1: entity work.MUX_GATE_1
    port map (
      sel => up_notdown,
      in_0 => s0,
      in_1 => s1,
      p_out => s2);
  gate2: entity work.T_FF -- T_FF
    port map (
      T => hold,
      clk => s2,
      Q => s4,
      Qn => s3);
  gate3: entity work.MUX_GATE_1
    port map (
      sel => up_notdown,
      in_0 => s3,
      in_1 => s4,
      p_out => s5);
  gate4: entity work.T_FF -- T_FF
    port map (
      T => hold,
      clk => s5,
      Q => s7,
      Qn => s6);
  gate5: entity work.MUX_GATE_1
    port map (
      sel => up_notdown,
      in_0 => s6,
      in_1 => s7,
      p_out => s8);
  gate6: entity work.T_FF -- T_FF
    port map (
      T => hold,
      clk => s8,
      Q => s9);
  op(0) <= s1;
  op(1) <= s4;
  op(2) <= s7;
  op(3) <= s9;
end Behavioral;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity MUX_GATE_BUS_1 is
  generic ( Bits : integer ); 
  port (
    p_out: out std_logic_vector ((Bits-1) downto 0);
    sel: in std_logic;
    
    in_0: in std_logic_vector ((Bits-1) downto 0);
    in_1: in std_logic_vector ((Bits-1) downto 0) );
end MUX_GATE_BUS_1;

architecture Behavioral of MUX_GATE_BUS_1 is
begin
  with sel select
    p_out <=
      in_0 when '0',
      in_1 when '1',
      (others => '0') when others;
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity DECODER_4 is
  port (
    out_0: out std_logic;
    out_1: out std_logic;
    out_2: out std_logic;
    out_3: out std_logic;
    out_4: out std_logic;
    out_5: out std_logic;
    out_6: out std_logic;
    out_7: out std_logic;
    out_8: out std_logic;
    out_9: out std_logic;
    out_10: out std_logic;
    out_11: out std_logic;
    out_12: out std_logic;
    out_13: out std_logic;
    out_14: out std_logic;
    out_15: out std_logic;
    sel: in std_logic_vector (3 downto 0) );
end DECODER_4;

architecture Behavioral of DECODER_4 is
begin
  out_0 <= '1' when sel = "0000" else '0';
  out_1 <= '1' when sel = "0001" else '0';
  out_2 <= '1' when sel = "0010" else '0';
  out_3 <= '1' when sel = "0011" else '0';
  out_4 <= '1' when sel = "0100" else '0';
  out_5 <= '1' when sel = "0101" else '0';
  out_6 <= '1' when sel = "0110" else '0';
  out_7 <= '1' when sel = "0111" else '0';
  out_8 <= '1' when sel = "1000" else '0';
  out_9 <= '1' when sel = "1001" else '0';
  out_10 <= '1' when sel = "1010" else '0';
  out_11 <= '1' when sel = "1011" else '0';
  out_12 <= '1' when sel = "1100" else '0';
  out_13 <= '1' when sel = "1101" else '0';
  out_14 <= '1' when sel = "1110" else '0';
  out_15 <= '1' when sel = "1111" else '0';
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

entity n1_bit_regitor is
  port (
    p_in: in std_logic;
    CLK: in std_logic;
    L: in std_logic;
    onotp: out std_logic);
end n1_bit_regitor;

architecture Behavioral of n1_bit_regitor is
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

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity n16_bit_registor is
  port (
    clk: in std_logic;
    L: in std_logic;
    p_IN: in std_logic_vector(15 downto 0);
    onotp: out std_logic_vector(15 downto 0));
end n16_bit_registor;

architecture Behavioral of n16_bit_registor is
  signal s0: std_logic;
  signal s1: std_logic;
  signal s2: std_logic;
  signal s3: std_logic;
  signal s4: std_logic;
  signal s5: std_logic;
  signal s6: std_logic;
  signal s7: std_logic;
  signal s8: std_logic;
  signal s9: std_logic;
  signal s10: std_logic;
  signal s11: std_logic;
  signal s12: std_logic;
  signal s13: std_logic;
  signal s14: std_logic;
  signal s15: std_logic;
  signal s16: std_logic;
  signal s17: std_logic;
  signal s18: std_logic;
  signal s19: std_logic;
  signal s20: std_logic;
  signal s21: std_logic;
  signal s22: std_logic;
  signal s23: std_logic;
  signal s24: std_logic;
  signal s25: std_logic;
  signal s26: std_logic;
  signal s27: std_logic;
  signal s28: std_logic;
  signal s29: std_logic;
  signal s30: std_logic;
  signal s31: std_logic;
  signal s32: std_logic_vector(3 downto 0);
  signal s33: std_logic_vector(3 downto 0);
  signal s34: std_logic_vector(3 downto 0);
begin
  s28 <= p_IN(0);
  s24 <= p_IN(1);
  s26 <= p_IN(2);
  s30 <= p_IN(3);
  s20 <= p_IN(4);
  s16 <= p_IN(5);
  s18 <= p_IN(6);
  s22 <= p_IN(7);
  s12 <= p_IN(8);
  s8 <= p_IN(9);
  s10 <= p_IN(10);
  s14 <= p_IN(11);
  s4 <= p_IN(12);
  s0 <= p_IN(13);
  s2 <= p_IN(14);
  s6 <= p_IN(15);
  gate0: entity work.n1_bit_regitor
    port map (
      p_in => s0,
      CLK => clk,
      L => L,
      onotp => s1);
  gate1: entity work.n1_bit_regitor
    port map (
      p_in => s2,
      CLK => clk,
      L => L,
      onotp => s3);
  gate2: entity work.n1_bit_regitor
    port map (
      p_in => s4,
      CLK => clk,
      L => L,
      onotp => s5);
  gate3: entity work.n1_bit_regitor
    port map (
      p_in => s6,
      CLK => clk,
      L => L,
      onotp => s7);
  gate4: entity work.n1_bit_regitor
    port map (
      p_in => s8,
      CLK => clk,
      L => L,
      onotp => s9);
  gate5: entity work.n1_bit_regitor
    port map (
      p_in => s10,
      CLK => clk,
      L => L,
      onotp => s11);
  gate6: entity work.n1_bit_regitor
    port map (
      p_in => s12,
      CLK => clk,
      L => L,
      onotp => s13);
  gate7: entity work.n1_bit_regitor
    port map (
      p_in => s14,
      CLK => clk,
      L => L,
      onotp => s15);
  gate8: entity work.n1_bit_regitor
    port map (
      p_in => s16,
      CLK => clk,
      L => L,
      onotp => s17);
  gate9: entity work.n1_bit_regitor
    port map (
      p_in => s18,
      CLK => clk,
      L => L,
      onotp => s19);
  gate10: entity work.n1_bit_regitor
    port map (
      p_in => s20,
      CLK => clk,
      L => L,
      onotp => s21);
  gate11: entity work.n1_bit_regitor
    port map (
      p_in => s22,
      CLK => clk,
      L => L,
      onotp => s23);
  gate12: entity work.n1_bit_regitor
    port map (
      p_in => s24,
      CLK => clk,
      L => L,
      onotp => s25);
  gate13: entity work.n1_bit_regitor
    port map (
      p_in => s26,
      CLK => clk,
      L => L,
      onotp => s27);
  gate14: entity work.n1_bit_regitor
    port map (
      p_in => s28,
      CLK => clk,
      L => L,
      onotp => s29);
  gate15: entity work.n1_bit_regitor
    port map (
      p_in => s30,
      CLK => clk,
      L => L,
      onotp => s31);
  s32(0) <= s5;
  s32(1) <= s1;
  s32(2) <= s3;
  s32(3) <= s7;
  s33(0) <= s13;
  s33(1) <= s9;
  s33(2) <= s11;
  s33(3) <= s15;
  s34(0) <= s21;
  s34(1) <= s17;
  s34(2) <= s19;
  s34(3) <= s23;
  onotp(0) <= s29;
  onotp(1) <= s25;
  onotp(2) <= s27;
  onotp(3) <= s31;
  onotp(7 downto 4) <= s34;
  onotp(11 downto 8) <= s33;
  onotp(15 downto 12) <= s32;
end Behavioral;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity MUX_GATE_BUS_4 is
  generic ( Bits : integer ); 
  port (
    p_out: out std_logic_vector ((Bits-1) downto 0);
    sel: in std_logic_vector (3 downto 0);
    
    in_0: in std_logic_vector ((Bits-1) downto 0);
    in_1: in std_logic_vector ((Bits-1) downto 0);
    in_2: in std_logic_vector ((Bits-1) downto 0);
    in_3: in std_logic_vector ((Bits-1) downto 0);
    in_4: in std_logic_vector ((Bits-1) downto 0);
    in_5: in std_logic_vector ((Bits-1) downto 0);
    in_6: in std_logic_vector ((Bits-1) downto 0);
    in_7: in std_logic_vector ((Bits-1) downto 0);
    in_8: in std_logic_vector ((Bits-1) downto 0);
    in_9: in std_logic_vector ((Bits-1) downto 0);
    in_10: in std_logic_vector ((Bits-1) downto 0);
    in_11: in std_logic_vector ((Bits-1) downto 0);
    in_12: in std_logic_vector ((Bits-1) downto 0);
    in_13: in std_logic_vector ((Bits-1) downto 0);
    in_14: in std_logic_vector ((Bits-1) downto 0);
    in_15: in std_logic_vector ((Bits-1) downto 0) );
end MUX_GATE_BUS_4;

architecture Behavioral of MUX_GATE_BUS_4 is
begin
  with sel select
    p_out <=
      in_0 when "0000",
      in_1 when "0001",
      in_2 when "0010",
      in_3 when "0011",
      in_4 when "0100",
      in_5 when "0101",
      in_6 when "0110",
      in_7 when "0111",
      in_8 when "1000",
      in_9 when "1001",
      in_10 when "1010",
      in_11 when "1011",
      in_12 when "1100",
      in_13 when "1101",
      in_14 when "1110",
      in_15 when "1111",
      (others => '0') when others;
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity main is
  port (
    change: in std_logic;
    p_in: in std_logic_vector(15 downto 0);
    decre: in std_logic;
    hold: in std_logic;
    onotp: out std_logic_vector(15 downto 0));
end main;

architecture Behavioral of main is
  signal s0: std_logic_vector(3 downto 0);
  signal s1: std_logic;
  signal s2: std_logic_vector(15 downto 0);
  signal s3: std_logic_vector(15 downto 0);
  signal s4: std_logic;
  signal s5: std_logic_vector(15 downto 0);
  signal s6: std_logic;
  signal s7: std_logic_vector(15 downto 0);
  signal s8: std_logic;
  signal s9: std_logic_vector(15 downto 0);
  signal s10: std_logic;
  signal s11: std_logic_vector(15 downto 0);
  signal s12: std_logic;
  signal s13: std_logic_vector(15 downto 0);
  signal s14: std_logic;
  signal s15: std_logic_vector(15 downto 0);
  signal s16: std_logic;
  signal s17: std_logic_vector(15 downto 0);
  signal s18: std_logic;
  signal s19: std_logic_vector(15 downto 0);
  signal s20: std_logic;
  signal s21: std_logic_vector(15 downto 0);
  signal s22: std_logic;
  signal s23: std_logic_vector(15 downto 0);
  signal s24: std_logic;
  signal s25: std_logic_vector(15 downto 0);
  signal s26: std_logic;
  signal s27: std_logic_vector(15 downto 0);
  signal s28: std_logic;
  signal s29: std_logic_vector(15 downto 0);
  signal s30: std_logic;
  signal s31: std_logic_vector(15 downto 0);
  signal s32: std_logic;
  signal s33: std_logic_vector(15 downto 0);
  signal s34: std_logic;
  signal s35: std_logic;
  signal s36: std_logic;
  signal s37: std_logic;
  signal s38: std_logic;
  signal s39: std_logic;
  signal s40: std_logic;
  signal s41: std_logic;
  signal s42: std_logic;
  signal s43: std_logic;
  signal s44: std_logic;
  signal s45: std_logic;
  signal s46: std_logic;
  signal s47: std_logic;
  signal s48: std_logic;
  signal s49: std_logic;
  signal s50: std_logic_vector(3 downto 0);
  signal s51: std_logic_vector(3 downto 0);
  signal s52: std_logic_vector(3 downto 0);
  signal s53: std_logic_vector(3 downto 0);
  signal s54: std_logic_vector(63 downto 0);
  signal s55: std_logic_vector(63 downto 0);
  signal s56: std_logic_vector(63 downto 0);
  signal s57: std_logic_vector(63 downto 0);
  signal s58: std_logic_vector(15 downto 0);
  signal s59: std_logic_vector(15 downto 0);
  signal s60: std_logic_vector(15 downto 0);
  signal s61: std_logic_vector(15 downto 0);
  signal s62: std_logic_vector(15 downto 0);
  signal s63: std_logic_vector(15 downto 0);
  signal s64: std_logic_vector(15 downto 0);
  signal s65: std_logic_vector(15 downto 0);
  signal s66: std_logic_vector(15 downto 0);
  signal s67: std_logic_vector(15 downto 0);
  signal s68: std_logic_vector(15 downto 0);
  signal s69: std_logic_vector(15 downto 0);
  signal s70: std_logic_vector(15 downto 0);
  signal s71: std_logic_vector(15 downto 0);
  signal s72: std_logic_vector(15 downto 0);
  signal s73: std_logic_vector(15 downto 0);
begin
  gate0: entity work.counter_up_and_down
    port map (
      clk => change,
      up_notdown => decre,
      hold => hold,
      op => s0);
  gate1: entity work.MUX_GATE_BUS_1
    generic map (
      Bits => 16)
    port map (
      sel => decre,
      in_0 => p_in,
      in_1 => "0000000000000000",
      p_out => s2);
  gate2: entity work.DECODER_4
    port map (
      sel => s0,
      out_0 => s34,
      out_1 => s35,
      out_2 => s36,
      out_3 => s37,
      out_4 => s38,
      out_5 => s39,
      out_6 => s40,
      out_7 => s41,
      out_8 => s42,
      out_9 => s43,
      out_10 => s44,
      out_11 => s45,
      out_12 => s46,
      out_13 => s47,
      out_14 => s48,
      out_15 => s49);
  s50(0) <= s34;
  s50(1) <= s35;
  s50(2) <= s36;
  s50(3) <= s37;
  s51(0) <= s38;
  s51(1) <= s39;
  s51(2) <= s40;
  s51(3) <= s41;
  s52(0) <= s42;
  s52(1) <= s43;
  s52(2) <= s44;
  s52(3) <= s45;
  s53(0) <= s46;
  s53(1) <= s47;
  s53(2) <= s48;
  s53(3) <= s49;
  s14 <= s50(0);
  s16 <= s50(1);
  s18 <= s50(2);
  s20 <= s50(3);
  s6 <= s51(0);
  s8 <= s51(1);
  s10 <= s51(2);
  s12 <= s51(3);
  s1 <= s52(0);
  s4 <= s52(1);
  s26 <= s52(2);
  s32 <= s52(3);
  s30 <= s53(0);
  s28 <= s53(1);
  s22 <= s53(2);
  s24 <= s53(3);
  gate3: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s1,
      p_IN => s2,
      onotp => s3);
  gate4: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s4,
      p_IN => s2,
      onotp => s5);
  gate5: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s6,
      p_IN => s2,
      onotp => s7);
  gate6: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s8,
      p_IN => s2,
      onotp => s9);
  gate7: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s10,
      p_IN => s2,
      onotp => s11);
  gate8: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s12,
      p_IN => s2,
      onotp => s13);
  gate9: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s14,
      p_IN => s2,
      onotp => s15);
  gate10: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s16,
      p_IN => s2,
      onotp => s17);
  gate11: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s18,
      p_IN => s2,
      onotp => s19);
  gate12: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s20,
      p_IN => s2,
      onotp => s21);
  gate13: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s22,
      p_IN => s2,
      onotp => s23);
  gate14: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s24,
      p_IN => s2,
      onotp => s25);
  gate15: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s26,
      p_IN => s2,
      onotp => s27);
  gate16: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s28,
      p_IN => s2,
      onotp => s29);
  gate17: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s30,
      p_IN => s2,
      onotp => s31);
  gate18: entity work.n16_bit_registor
    port map (
      clk => change,
      L => s32,
      p_IN => s2,
      onotp => s33);
  s54(15 downto 0) <= s15;
  s54(31 downto 16) <= s17;
  s54(47 downto 32) <= s19;
  s54(63 downto 48) <= s21;
  s55(15 downto 0) <= s7;
  s55(31 downto 16) <= s9;
  s55(47 downto 32) <= s11;
  s55(63 downto 48) <= s13;
  s56(15 downto 0) <= s3;
  s56(31 downto 16) <= s5;
  s56(47 downto 32) <= s27;
  s56(63 downto 48) <= s33;
  s57(15 downto 0) <= s31;
  s57(31 downto 16) <= s29;
  s57(47 downto 32) <= s23;
  s57(63 downto 48) <= s25;
  s58 <= s54(15 downto 0);
  s59 <= s54(31 downto 16);
  s60 <= s54(47 downto 32);
  s61 <= s54(63 downto 48);
  s62 <= s55(15 downto 0);
  s63 <= s55(31 downto 16);
  s64 <= s55(47 downto 32);
  s65 <= s55(63 downto 48);
  s66 <= s56(15 downto 0);
  s67 <= s56(31 downto 16);
  s68 <= s56(47 downto 32);
  s69 <= s56(63 downto 48);
  s70 <= s57(15 downto 0);
  s71 <= s57(31 downto 16);
  s72 <= s57(47 downto 32);
  s73 <= s57(63 downto 48);
  gate19: entity work.MUX_GATE_BUS_4
    generic map (
      Bits => 16)
    port map (
      sel => s0,
      in_0 => s58,
      in_1 => s59,
      in_2 => s60,
      in_3 => s61,
      in_4 => s62,
      in_5 => s63,
      in_6 => s64,
      in_7 => s65,
      in_8 => s66,
      in_9 => s67,
      in_10 => s68,
      in_11 => s69,
      in_12 => s70,
      in_13 => s71,
      in_14 => s72,
      in_15 => s73,
      p_out => onotp);
end Behavioral;

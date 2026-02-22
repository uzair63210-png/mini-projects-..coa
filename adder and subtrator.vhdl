-- basic adder and subtrator using full adder. sub when cin is 1 and add when cin is 0. 


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity DIG_Add is
  generic ( Bits: integer ); 
  port (
    s: out std_logic_vector((Bits-1) downto 0);
    c_o: out std_logic;
    a: in std_logic_vector((Bits-1) downto 0);
    b: in std_logic_vector((Bits-1) downto 0);
    c_i: in std_logic );
end DIG_Add;

architecture Behavioral of DIG_Add is
   signal temp : std_logic_vector(Bits downto 0);
begin
   temp <= ('0' & a) + b + c_i;

   s    <= temp((Bits-1) downto 0);
   c_o  <= temp(Bits);
end Behavioral;


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity main is
  port (
    B: in std_logic_vector(15 downto 0);
    cin: in std_logic;
    A: in std_logic_vector(15 downto 0);
    onotp: out std_logic_vector(15 downto 0);
    cout: out std_logic);
end main;

architecture Behavioral of main is
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
  signal s32: std_logic;
  signal s33: std_logic;
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
  signal s50: std_logic;
  signal s51: std_logic;
  signal s52: std_logic;
  signal s53: std_logic;
  signal s54: std_logic;
  signal s55: std_logic;
  signal s56: std_logic;
  signal s57: std_logic;
  signal s58: std_logic;
  signal s59: std_logic;
  signal s60: std_logic;
  signal s61: std_logic;
  signal s62: std_logic;
begin
  s6 <= (B(0) XOR cin);
  s1 <= (B(1) XOR cin);
  s14 <= (B(2) XOR cin);
  s9 <= (B(3) XOR cin);
  s22 <= (B(4) XOR cin);
  s17 <= (B(5) XOR cin);
  s30 <= (B(6) XOR cin);
  s25 <= (B(7) XOR cin);
  s41 <= (B(8) XOR cin);
  s48 <= (B(9) XOR cin);
  s44 <= (B(10) XOR cin);
  s54 <= (B(11) XOR cin);
  s50 <= (B(12) XOR cin);
  s60 <= (B(13) XOR cin);
  s56 <= (B(14) XOR cin);
  s62 <= (B(15) XOR cin);
  s5 <= A(0);
  s0 <= A(1);
  s13 <= A(2);
  s8 <= A(3);
  s21 <= A(4);
  s16 <= A(5);
  s29 <= A(6);
  s24 <= A(7);
  s40 <= A(8);
  s47 <= A(9);
  s43 <= A(10);
  s53 <= A(11);
  s49 <= A(12);
  s59 <= A(13);
  s55 <= A(14);
  s61 <= A(15);
  gate0: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s5,
      b => s6,
      c_i => cin,
      s => s7,
      c_o => s2);
  gate1: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s0,
      b => s1,
      c_i => s2,
      s => s3,
      c_o => s4);
  gate2: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s13,
      b => s14,
      c_i => s4,
      s => s15,
      c_o => s10);
  gate3: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s8,
      b => s9,
      c_i => s10,
      s => s11,
      c_o => s12);
  gate4: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s21,
      b => s22,
      c_i => s12,
      s => s23,
      c_o => s18);
  gate5: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s16,
      b => s17,
      c_i => s18,
      s => s19,
      c_o => s20);
  gate6: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s29,
      b => s30,
      c_i => s20,
      s => s31,
      c_o => s26);
  gate7: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s24,
      b => s25,
      c_i => s26,
      s => s27,
      c_o => s28);
  gate8: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s40,
      b => s41,
      c_i => s28,
      s => s32,
      c_o => s42);
  gate9: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s47,
      b => s48,
      c_i => s42,
      s => s33,
      c_o => s45);
  gate10: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s43,
      b => s44,
      c_i => s45,
      s => s34,
      c_o => s46);
  gate11: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s53,
      b => s54,
      c_i => s46,
      s => s35,
      c_o => s51);
  gate12: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s49,
      b => s50,
      c_i => s51,
      s => s36,
      c_o => s52);
  gate13: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s59,
      b => s60,
      c_i => s52,
      s => s37,
      c_o => s57);
  gate14: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s55,
      b => s56,
      c_i => s57,
      s => s38,
      c_o => s58);
  gate15: entity work.DIG_Add
    generic map (
      Bits => 1)
    port map (
      a => s61,
      b => s62,
      c_i => s58,
      s => s39,
      c_o => cout);
  onotp(0) <= s7;
  onotp(1) <= s3;
  onotp(2) <= s15;
  onotp(3) <= s11;
  onotp(4) <= s23;
  onotp(5) <= s19;
  onotp(6) <= s31;
  onotp(7) <= s27;
  onotp(8) <= s32;
  onotp(9) <= s33;
  onotp(10) <= s34;
  onotp(11) <= s35;
  onotp(12) <= s36;
  onotp(13) <= s37;
  onotp(14) <= s38;
  onotp(15) <= s39;
end Behavioral;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;


entity register_file is
  port ( I_CLK : in std_logic;
         I_DDDDD : in std_logic_vector( 4 downto 0);
         I_DIN : in std_logic_vector(31 downto 0);
         I_RRRRR : in std_logic_vector( 4 downto 0);
         I_WE    : in std_logic;
         I_WE_ADR : std_logic_vector(4 downto 0);
         Q_D     : out std_logic_vector(31 downto 0);
         Q_R     : out std_logic_vector(31 downto 0));
end register_file ;

architecture Behavioral of register_file is
  component reg_32
    port(  I_CLK : in std_logic;

           I_D : in std_logic_vector (31 downto 0);
           I_WE : in std_logic ;

           Q : out std_logic_vector (31 downto 0));

  end component;
  
  signal R_R00 : std_logic_vector(31 downto 0);
  signal R_R01 : std_logic_vector(31 downto 0);
  signal R_R02 : std_logic_vector(31 downto 0);
  signal R_R03 : std_logic_vector(31 downto 0);
  signal R_R04 : std_logic_vector(31 downto 0);
  signal R_R05 : std_logic_vector(31 downto 0);
  signal R_R06 : std_logic_vector(31 downto 0);
  signal R_R07 : std_logic_vector(31 downto 0);
  signal R_R08 : std_logic_vector(31 downto 0);
  signal R_R09 : std_logic_vector(31 downto 0);
  signal R_R10 : std_logic_vector(31 downto 0);  
  signal R_R11 : std_logic_vector(31 downto 0);
  signal R_R12 : std_logic_vector(31 downto 0);
  signal R_R13 : std_logic_vector(31 downto 0);
  signal R_R14 : std_logic_vector(31 downto 0);
  signal R_R15 : std_logic_vector(31 downto 0);
  signal R_SP  : std_logic_vector(31 downto 0); -- stack pointer

  signal L_ADR : std_logic_vector(15 downto 0);
  signal L_DIN  : std_logic_vector(31 downto 0);
  signal L_DDDD : std_logic_vector( 4 downto 1);
  signal L_DSP : std_logic_vector(15 downto 0);
  signal L_WE_SP : std_logic;
  signal L_WE : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
  signal L_WE_A : std_logic :='0';
  signal L_WE_D : std_logic_vector(31 downto 0);
  signal L_WE_D2 : std_logic_vector( 1 downto 0);
  signal L_WE_DD : std_logic_vector(31 downto 0);
  signal L_WE_IO : std_logic_vector(31 downto 0);

  begin

    r00: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE( 0 ), I_D => L_DIN, Q => R_R00);
    r01: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE( 1 ), I_D => L_DIN, Q => R_R01);
    r02: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE( 2 ), I_D => L_DIN, Q => R_R02);
    r03: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE( 3), I_D => L_DIN, Q => R_R03);
    r04: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE( 4), I_D => L_DIN, Q => R_R04);
    r05: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE(5), I_D => L_DIN, Q => R_R05);
    r06: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE(6), I_D => L_DIN, Q => R_R06);
    r07: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE(7), I_D => L_DIN, Q => R_R07);
    r08: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE(8), I_D => L_DIN, Q => R_R08);
    r09: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE(9), I_D => L_DIN, Q => R_R09);
    r10: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE(10), I_D => L_DIN, Q => R_R10);
    r11: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE(11), I_D => L_DIN, Q => R_R11);
    r12: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE(12), I_D => L_DIN, Q => R_R12);
    r13: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE(13), I_D => L_DIN, Q => R_R13);
    r14: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE(14), I_D => L_DIN, Q => R_R14);
    r15: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE(15), I_D => L_DIN, Q => R_R15);
    --sp: reg_32 port map(I_CLK => I_CLK, I_WE => L_WE_SP, I_D => L_DSP, Q => R_SP);--inu

    
   début : process(R_R00, R_R01, R_R02, R_R03, R_R04, R_R05, R_R06, R_R07,R_R08, R_R09, R_R10, R_R11, R_R12, R_R13, R_R14, R_R15,I_DDDDD)

    begin
      case I_DDDDD is
        when "00000" => Q_D <= R_R00;
        when "00001" => Q_D <= R_R01;
        when "00010" => Q_D <= R_R02;
        when "00011" => Q_D <= R_R03;
        when "00100" => Q_D <= R_R04;
        when "00101" => Q_D <= R_R05;
        when "00110" => Q_D <= R_R06;
        when "00111" => Q_D <= R_R07;
        when "01000" => Q_D <= R_R08;
        when "01001" => Q_D <= R_R09;
        when "01010" => Q_D <= R_R10;
        when "01011" => Q_D <= R_R11;
        when "01100" => Q_D <= R_R12;
        when "01101" => Q_D <= R_R13;
        when "01110" => Q_D <= R_R14;
        when others => Q_D <= R_R15;
      end case;
    end process;

    process(R_R00, R_R01, R_R02, R_R03, R_R04, R_R05, R_R06, R_R07,
            R_R08, R_R09, R_R10, R_R11, R_R12, R_R13, R_R14, R_R15, I_RRRRR)
    begin
      case I_RRRRR is
        when "00000"=>Q_R <= R_R00;
        when "00001" => Q_R <= R_R01;
        when "00010" => Q_R <= R_R02;
        when "00011" => Q_R <= R_R03;
        when "00100" => Q_R <= R_R04;
        when "00101" => Q_R <= R_R05;
        when "00110" => Q_R <= R_R06;
        when "00111" => Q_R <= R_R07;
        when "01000" => Q_R <= R_R08;
        when "01001" => Q_R <= R_R09;
        when "01010" => Q_R <= R_R10;
        when "01011" => Q_R <= R_R11;
        when "01100" => Q_R <= R_R12;
        when "01101" => Q_R <= R_R13;
        when "01110" => Q_R <= R_R14;
        when others => Q_R <= R_R15;

      end case;
    end process;

    process( I_WE, I_WE_ADR, I_CLK)
    begin
      L_WE <= "00000000000000000000000000000000";
      if (I_WE = '0') then
        L_WE <= "00000000000000000000000000000000";
        L_WE_A <= '0';
      end if;
      
      if  (I_WE = '1') then
          L_WE_A <= '1';
        case I_WE_ADR is
          when "00000" =>
            L_WE(0)<= '1';
            L_WE(31 downto 1)<= "0000000000000000000000000000000";
            L_DIN <= I_DIN;
            
          when "00001" =>
            L_WE(0) <= '0';
            L_WE(1) <= '1';
            L_WE(31 downto 2) <= "000000000000000000000000000000";
            L_DIN <= I_DIN;
            
          when "00010" =>
            L_WE (1 downto 0) <= "00";
            L_WE (2) <= '1';
            L_WE (31 downto 3) <="00000000000000000000000000000";
            L_DIN <= I_DIN;
            
          when"00011" =>
            L_WE (2 downto 0) <= "000";
            L_WE (3) <= '1';
            L_WE (31 downto 4) <="0000000000000000000000000000";
            L_DIN <= I_DIN;
 
          when "00100" =>
            L_WE (3 downto 0) <= "0000";
            L_WE (4) <= '1';
            L_WE (31 downto 5) <="000000000000000000000000000";           
            L_DIN <= I_DIN;
            
          when "00101" =>
            L_WE (4 downto 0) <= "00000";
            L_WE (5) <= '1';
            L_WE (31 downto 6) <="00000000000000000000000000";
            L_DIN <= I_DIN;

          when "00110" =>
            L_WE (5 downto 0) <= "000000";
            L_WE (6) <= '1';
            L_WE (31 downto 7) <="0000000000000000000000000";
            L_DIN <= I_DIN;
            
          when "00111" =>
            L_WE (6 downto 0) <= "0000000";
            L_WE (7) <= '1';
            L_WE (31 downto 8) <="000000000000000000000000";
            L_DIN <= I_DIN;
            
          when "01000" =>
            L_WE (7 downto 0) <= "00000000";
            L_WE (8) <= '1';
            L_WE (31 downto 9) <="00000000000000000000000";
            L_DIN <= I_DIN;
            
          when "01001" =>
            L_WE (8 downto 0) <= "000000000";
            L_WE (9) <= '1';
            L_WE (31 downto 10) <="0000000000000000000000";
            L_DIN <= I_DIN;
            
          when "01010" =>
            L_WE (9 downto 0) <= "0000000000";
            L_WE (10) <= '1';
            L_WE (31 downto 11) <="000000000000000000000";
            L_DIN <= I_DIN;
            
          when "01011" =>
            L_WE (10 downto 0) <= "00000000000";
            L_WE (11) <= '1';
            L_WE (31 downto 12) <="00000000000000000000";
            L_DIN <= I_DIN;
            
          when "01100" =>
            L_WE (11 downto 0) <= "000000000000";
            L_WE (12) <= '1';
            L_WE (31 downto 13) <="0000000000000000000";
            L_DIN <= I_DIN;
            
          when "01101" =>
            L_WE (12 downto 0) <= "0000000000000";
            L_WE (13) <= '1';
            L_WE (31 downto 14) <="000000000000000000";
            L_DIN <= I_DIN;
            
          when "01110" =>
            L_WE (13 downto 0) <= "00000000000000";
            L_WE (14) <= '1';
            L_WE (31 downto 15) <="00000000000000000";
            L_DIN <= I_DIN;
            
          when others =>
            L_WE (14 downto 0) <= "000000000000000";
            L_WE (15) <= '1';
            L_WE (31 downto 16) <="0000000000000000";
            L_DIN <= I_DIN;
            
        end case;
      end if;
     
      
   end process;
      
  end Behavioral;  

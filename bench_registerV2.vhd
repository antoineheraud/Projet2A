library ieee; 
use ieee.std_logic_1164.all; 

entity Reg_TB is     -- entity declaration 
end Reg_TB; 

architecture TB of Reg_TB is
  component register_file
    port (
      I_CLK: in std_logic;
      I_WE    : in std_logic;--RegWrite
      I_WE_ADR: in std_logic_vector(4 downto 0);--WriteRegNum
      I_DIN      : in std_logic_vector(31 downto 0);--WriteData
      I_DDDDD     : in std_logic_vector(4 downto 0);--ReadRegNumA
      I_RRRRR     : in std_logic_vector(4 downto 0);--ReadRegNumB
    Q_D        : out std_logic_vector(31 downto 0);--PortA
    Q_R        : out std_logic_vector(31 downto 0)--PortB
 ); 
end component; 

signal CLK      : std_logic :='1';
signal RegWrite : std_logic :='0';
signal WriteRegNum: std_logic_vector(4 downto 0) := "00000";
signal WriteData: std_logic_vector(31 downto 0) := (others => '0');
signal ReadRegNumA: std_logic_vector(4 downto 0) := "00000";
signal ReadRegNumB: std_logic_vector(4 downto 0) := "00000";
signal PortA : std_logic_vector(31 downto 0);
signal PortB : std_logic_vector(31 downto 0);

begin
  DUT :
    register_file
      port map
      (I_CLK     => CLK,
       I_WE      => RegWrite,
       I_WE_ADR  => WriteRegNum,
       I_DIN     => WriteData,
       I_DDDDD    => ReadRegNumA,
       I_RRRRR    => ReadRegNumB,
       Q_D       => PortA,
       Q_R       => PortB); 

-- concurrent process to offer clock signal
   process 
   begin 
     wait for 10 ns;
     CLK <= '0';
     wait for 10 ns;
     CLK <= '1';
   end process;
  process
  begin
    wait for 20 ns;
    
    wait for 20 ns;
    RegWrite <= '1';
    WriteData <= x"00000004";
    WriteRegnum <= "00100";
    ReadRegNumA <= "00100";
    wait for 20 ns;
    ReadRegNumA <= "00100";
    wait for 20 ns;
    WriteData <= x"deadbeef";
    WriteRegNum <= "00010";
    ReadRegNumB <= "00010";
    wait for 20 ns;
    RegWrite <= '0';
    --ReadRegNumB <= "00000";
    wait for 20 ns;
    ReadRegNumB <= "00010";
    RegWrite  <= '1';
    WriteData <= x"feedface";
    WriteRegNum <= "00010";
    wait for 40 ns;
    ReadRegNumB <= "00011";
    RegWrite  <= '0';
    WriteData <= x"00001111";
    WriteRegNum <= "00011";
    wait for 20 ns;
    WriteRegNum <= "00001";
    wait for 80 ns;
  end process;
end architecture;








    

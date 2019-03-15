----Pour l'instant juste la structure--------
library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg_32 is
port ( I_CLK : in std_logic;

I_D : in std_logic_vector (31 downto 0);
I_WE : in std_logic;

Q : out std_logic_vector (31 downto 0));


end reg_32;

architecture Behavioral of reg_32 is
 
signal L : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
begin
 
début : process(I_CLK)
begin
if (rising_edge(I_CLK)) then
if (I_WE = '1') then
L <= I_D;
end if;
end if;
end process;

Q <= L;

end Behavioral;   

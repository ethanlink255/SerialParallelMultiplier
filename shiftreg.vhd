----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2022 02:19:45 PM
-- Design Name: 
-- Module Name: shiftreg - shiftreg_behav
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shiftreg is
  generic (s
  
    w : integer := 10);
  Port ( 
    A, enabled, clk : in std_logic;
    Apar : out std_logic_vector((w - 1) downto 0)
  );
 
    signal apar_buf : std_logic_vector ((w-1) downto 0);
  
end shiftreg;

architecture shiftreg_behav of shiftreg is

begin
    Apar <= apar_buf;

    process(clk, A) is 
    begin   
        if (rising_edge(clk) and (enabled = '1')) then
            apar_buf(0) <= A;
            for i in 1 to (w - 1) loop
                apar_buf(i) <= apar_buf(i-1);
            end loop;
        end if;
    end process;

end shiftreg_behav;

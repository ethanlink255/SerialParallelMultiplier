----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2022 06:24:03 PM
-- Design Name: 
-- Module Name: top - top_behav
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_des is
    generic(
        w : integer := 12;
        t : integer := 4
    );
    
    Port(
        A, enabled, clk, B: in std_logic;
        TEST : out std_logic_vector((t - 1) downto 0);
        C : out std_logic 
    );
    
    signal Apar_int : std_logic_vector((w) downto 0);
    signal Qpar_int : std_logic_vector((w) downto 0);
end top_des;

architecture top_behav of top_des is
    component wilkes_sliced
    Port ( 
        Ap, B, C, enabled, clk : in std_logic;
        An, Q : out std_logic
    );
    end component;
begin
    Apar_int(0) <= A;
    Qpar_int(0) <= '0'; 
    
     
    slice_gen : for i in 1 to (w) generate
    begin
        ws : wilkes_sliced port map(
            Ap => Apar_int(i - 1),
            An => Apar_int(i),
            C => Qpar_int(i - 1),
            enabled => enabled,
            clk => clk, 
            B => B,
            Q => Qpar_int(i)
        );
    end generate slice_gen;
    
    -- TEST(0) <= Qpar_int(0);
    t_gen : for i in 0 to (t - 1) generate
    begin
        TEST(i) <= Qpar_int((i*t)); 
    end generate t_gen;
    
    
    
    C <= Qpar_int(w);

end top_behav;

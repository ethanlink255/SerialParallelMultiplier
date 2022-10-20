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
        w : integer := 3
    );
    
    Port(
        A, enabled, clk, B, reset: in std_logic;
        C : out std_logic 
    );
    
    signal Apar_int : std_logic_vector((w-1) downto 0);
end top_des;

architecture top_behav of top_des is
    component adderchain
    generic( 
        w : integer := 3
    );
    Port ( 
        A : std_logic_vector((w-1) downto 0);
        B, reset, clk: std_logic;
        C : out std_logic
    );
    end component;
    
    component shiftreg
    generic (
        w : integer := 3);
    Port ( 
        A, enabled, clk : in std_logic;
        Apar : out std_logic_vector((w - 1) downto 0)
    );
    end component;

begin
    
    sr : shiftreg port map(
        A => A,
        enabled => enabled,
        clk => clk,
        Apar => Apar_int
    );
    
    ac : adderchain port map(
        A => Apar_int,
        B => B,
        clk => clk,
        reset => reset,
        C => C
    );

end top_behav;

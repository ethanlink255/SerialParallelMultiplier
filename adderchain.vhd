----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2022 03:06:47 PM
-- Design Name: 
-- Module Name: adderchain - Behavioral
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

entity adderchain is
    generic (
    w : integer := 10);
    
  Port ( 
    A : std_logic_vector((w-1) downto 0);
    B, reset, clk: std_logic;
    C : out std_logic
  );
 
  signal carry : std_logic_vector(w downto 0);
  signal sin : std_logic_vector((w-1) downto 0);
  
end adderchain;

architecture adder_behav of adderchain is
    component slice
    port (
        A, B, clk: in std_logic;
        Q : out std_logic);
    end component;


begin
    carry(0) <= '0';
    C <= carry(w);

    
    slice_gen : for i in 0 to (w - 1) generate
    begin
        sin(i) <= A(i) and B;
        
        s : slice port map(
            A => carry(i),
            B => sin(i),
            clk => clk, 
            Q => carry(i + 1)
        );
      
    end generate slice_gen;
    
end adder_behav;

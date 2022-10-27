----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2022 04:13:06 PM
-- Design Name: 
-- Module Name: fslice - Behavioral
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

entity slice is
  Port ( 
    A, B, clk : in std_logic;
    Q : out std_logic
  );
  
   signal Qint : std_logic := '0';
   signal lo : std_logic := '0';
   signal Cin : std_logic := '0';
end slice;


architecture Behavioral of slice is
begin
   Qint <= (A xor B) xor  Cin;
   lo <= ((A xor B) and Cin) or (A and B);

    
   process(clk, Cin, Qint, lo) is
   begin
        if falling_edge(clk) then
           Cin <=lo;
           Q <= Qint;
        end if;
   end process;
   
end Behavioral;

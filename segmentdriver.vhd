----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/14/2023 01:54:36 PM
-- Design Name: 
-- Module Name: segmentdriver - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity segmentdriver is
    generic(n: integer := 3;
            i: integer := 15);
    Port ( display_A : in STD_LOGIC_VECTOR (n downto 0);
           display_B : in STD_LOGIC_VECTOR (n downto 0);
           display_C : in STD_LOGIC_VECTOR (n downto 0);
           display_D : in STD_LOGIC_VECTOR (n downto 0);
           segA : out STD_LOGIC;
           segB : out STD_LOGIC;
           segC : out STD_LOGIC;
           segD : out STD_LOGIC;
           segE : out STD_LOGIC;
           segF : out STD_LOGIC;
           segG : out STD_LOGIC;
           select_Display_A : out STD_LOGIC;
           select_Display_B : out STD_LOGIC;
           select_Display_C : out STD_LOGIC;
           select_Display_D : out STD_LOGIC;
           clk : in STD_LOGIC);
end segmentdriver;

architecture Behavioral of segmentdriver is
    component segment_7 is
    generic(n: integer := 6;
            i: integer := 3);
    Port ( Digit: in std_logic_vector (i downto 0);
           segment_A : out STD_LOGIC;
           segment_B : out STD_LOGIC;
           segment_C : out STD_LOGIC;
           segment_D : out STD_LOGIC;
           segment_E : out STD_LOGIC;
           segment_F : out STD_LOGIC;
           segment_G : out STD_LOGIC);
    end component;
    
    component clk_divider is
    generic(n: integer := 15);
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_clk : out STD_LOGIC_VECTOR (n downto 0));
    end component;
    
    signal temp_data: STD_LOGIC_VECTOR (n downto 0);
     signal clk_word: STD_LOGIC_VECTOR (i downto 0);
     signal slow_clk: STD_LOGIC;
begin

    uut: segment_7 port map (temp_data, segA, segB, segC, segD, segE, segF, segG);
    uut1: clk_divider port map (clk, '1', '0', clk_word);

slow_clk <= clk_word (15);

process(slow_clk)
    variable display_selection: std_logic_vector (1 downto 0);
    begin
    if slow_clk'event and slow_clk = '1' then
    
    comp: case display_selection is
    
    when "00" => temp_data <= display_A; --turns Anode 0 on
        select_Display_A <= '0';
        select_Display_B <= '1';
        select_Display_C <= '1';
        select_Display_D <= '1';
        display_selection := display_selection + '1';
        
    when "01" => temp_data <= display_B; --turns Anode 1 on
                select_Display_A <= '1';
                select_Display_B <= '0';
                select_Display_C <= '1';
                select_Display_D <= '1';
                display_selection := display_selection + '1';
                
                
    when "10" => temp_data <= display_C; --turns Anode 2 on
                        select_Display_A <= '1';
                        select_Display_B <= '1';
                        select_Display_C <= '0';
                        select_Display_D <= '1';
                        display_selection := display_selection + '1';
                        
    when others => temp_data <= display_D; --turns Anode 3 on
                                select_Display_A <= '1';
                                select_Display_B <= '1';
                                select_Display_C <= '1';
                                select_Display_D <= '0';
                                display_selection := display_selection + '1';
    end case;
    end if;
    end process;
end Behavioral;

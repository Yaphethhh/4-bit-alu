----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/14/2023 02:12:30 PM
-- Design Name: 
-- Module Name: lab1final - Behavioral
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

entity sevSegDisplay is
    generic(n: integer := 3;
    i: integer := 3);
    Port ( cin: in STD_LOGIC; 
           clk, en : in STD_LOGIC;
           s0,s1 : in STD_LOGIC;
           topselDispA : out STD_LOGIC;
           topselDispB : out STD_LOGIC;
           topselDispC : out STD_LOGIC;
           topselDispD : out STD_LOGIC;
           topsegA : out STD_LOGIC;
           topsegB : out STD_LOGIC;
           topsegC : out STD_LOGIC;
           topsegD : out STD_LOGIC;
           topsegE : out STD_LOGIC;
           topsegF : out STD_LOGIC;
           topsegG : out STD_LOGIC;
           cout : out STD_LOGIC;
           state_in: in std_logic_vector(2 downto 0));
end sevSegDisplay;

architecture structure of sevSegDisplay is
    component Lab3final is
    Port ( 
        s0: in STD_LOGIC;
        s1: in STD_LOGIC; 
        c_in, en: in STD_LOGIC;
        clk: in STD_LOGIC;
        sum1, sum2: out std_logic_vector(3 downto 0);
        state_in: in std_logic_vector(2 downto 0)
    );
end component;

COMPONENT segmentdriver is
    Port ( display_A : in STD_LOGIC_VECTOR (3 downto 0);
           display_B : in STD_LOGIC_VECTOR (3 downto 0);
           display_C : in STD_LOGIC_VECTOR (3 downto 0);
           display_D : in STD_LOGIC_VECTOR (3 downto 0);
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
end component;

signal Ai : STD_LOGIC_VECTOR (i downto 0);
signal Bi : STD_LOGIC_VECTOR (i downto 0);
signal Ci : STD_LOGIC_VECTOR (i downto 0);
signal Di : STD_LOGIC_VECTOR (i downto 0);
signal sum1, sum2: std_logic_vector(3 downto 0); 
  
signal c_out: std_logic;
begin
--top design for the all and control unit
controlunit: Lab3final port map (s0, s1, cin, en, clk, sum1, sum2,state_in);

--multiplexer that takes in one 4-bit digit and outputs a hexadecimal digit on 7 segment display
uut2: segmentdriver port map (Ai, Bi, Ci, Di, topsegA, topsegB, topsegC, topsegD, topsegE, topsegF, topsegG, topselDispA, topselDispB, topselDispC, topselDispD, clk);

--OUTPUT
--assigns output of the first alu to the first digit of 7 segment display
Ai(0) <= sum1(0);
Ai(1) <= sum1(1);
Ai(2) <= sum1(2);
Ai(3) <= sum1(3);
cout <= c_out;

--INPUT 
--assigns output of the second alu to the third digit of 7 segment display
Ci(0) <= sum2(0);
Ci(1) <= sum2(1);
Ci(2) <= sum2(2);
Ci(3) <= sum2(3);
end structure;

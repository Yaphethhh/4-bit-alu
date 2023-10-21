----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/11/2023 04:47:07 PM
-- Design Name: 
-- Module Name: nbitAdder - Behavioral
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

entity a_unit4 is
   generic(n: integer := 4);
    Port ( c_in : in STD_LOGIC;
           c_out: out STD_LOGIC;
           x,y : in STD_LOGIC_VECTOR (n-1 downto 0);
           s: out STD_LOGIC_VECTOR (n-1 downto 0);
           s0,s1: in STD_LOGIC
           );
end a_unit4;

architecture structure of a_unit4 is

component a_unit1 is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           c_out : out STD_LOGIC;
           sum : out STD_LOGIC;
           c_in : in STD_LOGIC;
           s0: in STD_LOGIC;
           s1: in STD_LOGIC;
           c: in STD_LOGIC);
end component ;

signal c: STD_LOGIC_VECTOR (n downto 0); 
signal sel: STD_LOGIC;
begin
c(0)<= c_in;
c_out <= c(n);

--implements 4 1-bit arithmetic units corresponding to Xi, Yi, Ci inputs and Si, Ci+1 outputs
fa: for i in 0 to n-1 generate 

fa_I: a_unit1 Port map(x(i),y(i),c(i+1),s(i),c(i),s0,s1,c(0));

end generate; 

end structure;

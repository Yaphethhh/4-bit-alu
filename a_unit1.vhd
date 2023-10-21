----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/11/2023 04:22:40 PM
-- Design Name: 
-- Module Name: FullAdder - Behavioral
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

entity a_unit1 is
--implements full adder/subtractor
--s0, s1 and c are selection lines which determines what the value of a and b would be
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           c_out : out STD_LOGIC;
           sum : out STD_LOGIC;
           c_in : in STD_LOGIC;
           s0: in STD_LOGIC;
           s1: in STD_LOGIC;
           c: in STD_LOGIC);
           
end a_unit1;


architecture dataflow of a_unit1 is

signal nots0, nots1, notB, notC ,A, B : std_logic;


begin

nots0<= not s0; 
nots1 <= not s1; 
notB <= not y;
notC <= not c;

--A SELECT LOGIC (select value of A based on selection table)
A<= s0 xor x;

--B SELECT LOGIC (select value of B based on selection table)
B <= (nots1 and notC and y) or (nots1 and s0 and y) or (s1 and nots0 and notC) or (nots1 and nots0 and c and notB);

--SUM
sum <= A xor B xor c_in;

--C_OUT
c_out <= (A and B) or (A and c_in) or (B and c_in);

end dataflow;

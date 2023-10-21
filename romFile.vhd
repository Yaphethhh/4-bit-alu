----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/26/2023 10:40:19 AM
-- Design Name: 
-- Module Name: ROMFile - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity romFile is
  port (
    address : in std_logic_vector(2 downto 0); 
    data : out std_logic_vector(3 downto 0); 
    en : in std_logic;
    clk : in std_logic
  );
end entity romFile;

architecture behavioral of romFile is
  type mem is array (0 to 7) of std_logic_vector(3 downto 0); 
  constant my_rom : mem := (
    "0000","0001","0010","0111",
    "0100","0101","0110","0111"
  );

begin
    process (clk)
    begin
        if rising_edge(clk) then
          if en = '1' then
    case address is
      when "000" =>
        data <= my_rom(0);
      when "001" =>
        data <= my_rom(1);
      when "010" =>
        data <= my_rom(2);
      when "011" =>
        data <= my_rom(3);
      when "100" =>
        data <= my_rom(4);
      when "101" =>
        data <= my_rom(5);
      when "110" =>
        data <= my_rom(6);
      when "111" =>
        data <= my_rom(7);
      when others =>
        data <= (others => '0');
    end case;
    end if;
    end if;
  end process;
end architecture behavioral;




----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/26/2023 12:28:02 PM
-- Design Name: 
-- Module Name: Control - Behavioral
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

entity Control is
    Port ( 
        c_in : in STD_LOGIC;
        clk : in STD_LOGIC;
        c_in_out: out STD_LOGIC;
        en : in STD_LOGIC;
        s0: in STD_LOGIC;
        s1: in STD_LOGIC;
        s0_out: out STD_LOGIC;
        s1_out: out STD_LOGIC;
        State_out : out STD_LOGIC_VECTOR(2 downto 0)
    );
end Control;

architecture Behavioral of Control is
    signal state : STD_LOGIC := '0';    
    constant IDLE_STATE : STD_LOGIC := '0';
    constant ACTIVE_STATE : STD_LOGIC := '1';
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if en = '1' then
                state <= ACTIVE_STATE;
            else
                state <= IDLE_STATE;
            end if;
        end if;
        case state is
                when IDLE_STATE =>
                    s0_out <= 'X';
                    s1_out <= 'X';
                    c_in_out <= 'X';
                when ACTIVE_STATE =>
                    s0_out <= s0 ;
                    s1_out <= s1;
                    c_in_out <= c_in;
                when others => 
                    s0_out <= 'X' ;
                    s1_out <= 'X';
                    c_in_out <= 'X';
            end case;
    end process;

 

end Behavioral;



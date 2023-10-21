library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; -- Add this library

entity Lab3final is
    Port ( 
        s0: in STD_LOGIC;
        s1: in STD_LOGIC; 
        c_in, en: in STD_LOGIC;
        clk: in STD_LOGIC;
        sum1, sum2: out std_logic_vector(3 downto 0);
        state_in: in std_logic_vector(2 downto 0) 
    );
end Lab3final;

architecture Behavioral of Lab3final is
    component a_unit4 is
        Port ( 
            c_in: in STD_LOGIC;
            c_out: out STD_LOGIC;
            x, y: in STD_LOGIC_VECTOR(3 downto 0);
            s: out STD_LOGIC_VECTOR(3 downto 0);
            s0, s1: in STD_LOGIC
        );
    end component;

    component romFile is
        port ( address: in std_logic_vector(2 downto 0);
               data: out std_logic_vector(3 downto 0);
         en : in std_logic;
         clk : in std_logic
        );
    end component;

    component romFile2 is
        port ( address: in std_logic_vector(2 downto 0);
               data: out std_logic_vector(3 downto 0);
         en : in std_logic;
         clk : in std_logic
        );
    end component;

    component Control is
        Port ( 
            c_in: in STD_LOGIC;
            clk: in STD_LOGIC;
            en: in STD_LOGIC;
            s0, s1: in STD_LOGIC;
            s0_out, s1_out: out STD_LOGIC;
            c_in_out: out STD_LOGIC;
            State_out: out STD_LOGIC_VECTOR(2 downto 0) -- Corrected the data type
        );
    end component;

    signal c_sig, s1_sig, s0_sig: std_logic;
    signal d_sig_a, d_sig_b: std_logic_vector(3 downto 0);
    signal state_sig: std_logic_vector(2 downto 0);

begin
    ctrl: Control port map (
        c_in => c_in,          
        clk => clk,        
        en => en,          
        s0 => s0,           
        s1 => s1,           
        s0_out => s0_sig,
        s1_out => s1_sig,
        c_in_out => c_sig,
        State_out => state_sig
    );

    ROM_A: romFile port map (address => state_in, data => d_sig_a,clk=>clk,en =>en);  
    ROM_B: romFile2 port map (address => state_in, data => d_sig_b,clk=>clk,en =>en); 

    adder1: a_unit4 port map (
        c_in => c_sig,
        x => d_sig_a,  
        y => d_sig_b,  
        s0 => s0_sig,           
        s1 => s1_sig,
        s => sum1
    );

    adder2: a_unit4 port map (
        c_in => c_sig,
        x => d_sig_b,  
        y => d_sig_a,  
        s0 => s0_sig,           
        s1 => s1_sig,
        s => sum2
    );

end Behavioral;
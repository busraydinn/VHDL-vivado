----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2026 22:48:56
-- Design Name: 
-- Module Name: tb_HalfAdder - Behavioral
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
 
entity tb_HalfAdder is
 
end tb_HalfAdder;

architecture Behavioral of tb_HalfAdder is
    signal A,B: std_logic:='0';
    signal Sum,Carry:std_logic;
begin
uut:entity work.HalfAdder
port map(
     A=>A,
     B=>B,
     Sum=>Sum,
    Carry=>Carry
);

stim_proc: process
begin
        A<='0';B<='0'; wait for 10 ns;
        A<='0';B<='1'; wait for 10 ns;        
        A<='1';B<='0'; wait for 10 ns;
        A<='1';B<='1'; wait for 10 ns;
        wait;
end process;
end Behavioral;

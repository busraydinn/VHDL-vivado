library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_tx is
generic(
    c_clkfreq :  integer := 100_000_000;
    c_baudrate:  integer := 115_200;
    c_stopbit :  integer := 2 
);
Port(
    clk : in std_logic;
    din_i: in std_logic_vector(7 downto 0);
    tx_start_i : std_logic;
    tx_o: out std_logic;
    tx_done_tick_o: out std_logic
);
end uart_tx;

architecture Behavioral of uart_tx is 
constant c_bittimer_limit:integer := c_clkfreq/c_baudrate;
signal timer: integer range 0 to c_bittimer_limit:=0;
signal bit_cnt:integer range 0 to 7;
signal stopbit_cnt:integer range 0 to c_stopbit;
signal shreg: std_logic_vector(7 downto 0);
type states is (S_IDLE,S_START,S_DATA,S_STOP);
signal state :states:=S_IDLE;
begin
PROC_MAIN: process(clk)
begin
    if(rising_edge(clk)) then
        case state is
            when S_IDLE=>
                tx_o<='1';
                timer<=0;
                bit_cnt<=0;
                stopbit_cnt<=0;
                tx_done_tick_o<='0';
                if(tx_start_i='1') then
                    timer<=0;
                    shreg<=din_i;
                    state<=S_START;
                else
                    timer<=timer+1;
                end if;
            when S_START=>
                tx_o<='0';
                if(timer=c_bittimer_limit-1)then
                    timer<=0;
                    state<=S_DATA;
                else
                    timer<=timer+1;
                end if;
            when S_DATA=>
            tx_o<=shreg(bit_cnt);
                if(timer=c_bittimer_limit-1) then
                    timer<=0;
                    if(bit_cnt=7) then
                        bit_cnt<=0;
                        state<=S_STOP;
                    else
                        bit_cnt<=bit_cnt+1;
                    end if;
                 else
                        timer<=timer+1;
                end if;
            when S_STOP=>
            tx_o<='1';
            if(timer=c_bittimer_limit-1) then
                if(stopbit_cnt=c_stopbit-1) then
                tx_done_tick_o<='1';
                timer<=0;
                state<=S_IDLE;
                else
                stopbit_cnt<=stopbit_cnt+1;
                end if;
            else
                timer<=timer+1;
            end if;
            
        end case;
        
    end if;
end process;


end Behavioral;

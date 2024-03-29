----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:49:15 04/24/2012 
-- Design Name: 
-- Module Name:    lut_oscilator - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity lut_oscilator is
    Port (  en 		: in  STD_LOGIC;
				Q			: out STD_LOGIC);
end lut_oscilator;

architecture Behavioral of lut_oscilator is

	signal sig_osc	:	STD_LOGIC;
	attribute keep : string;
	attribute keep of sig_osc : signal is "true";
	attribute keep of Behavioral: architecture is "true";
	
	attribute s: string;
	attribute s of Behavioral: architecture is "yes";
	attribute s of sig_osc: signal is "yes";

        attribute DONT_TOUCH : string;
        attribute DONT_TOUCH of sig_osc : signal is "TRUE";
        attribute ALLOW_COMBINATORIAL_LOOPS : string;
        attribute ALLOW_COMBINATORIAL_LOOPS of sig_osc : signal is "TRUE";
        
begin

	lut_inst : LUT6
	generic map (INIT => X"4444444444444444") -- Specify LUT Contents
	port map ( 	I0 => sig_osc, 
					I1 => en, 
					I2 => sig_osc,
					I3 => sig_osc,
					I4 => sig_osc,
					I5 => sig_osc,
					O =>  sig_osc);
					
	Q <= sig_osc;

end Behavioral;



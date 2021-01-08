-------------------------------------------------------------------------------
-- Adjustable LUT Oscilator Heater
-- Rui Zou (rz393@cornell.edu), Markus Happe, Christian Plessl
-- Each bit in adjust_heaters enables C_NUM_LUTS/32 number of lutosc, can
-- enable up to C_NUM_LUTS lutosc
---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.ALL;

library unisim;
use UNISIM.VComponents.all;

entity heater is
  generic
  (
    C_SLV_DWIDTH                   : integer              := 32;
    C_NUM_LUTS	                   : integer 	          := 65536
  );
  port
  (
    clk                     : in  std_logic;
    reset                   : in  std_logic;
    enable_heater           : in  std_logic;
    adjust_heaters          : in std_logic_vector (31 downto 0) := (others => '0');
    read_which_heater       : in std_logic_vector(0 to C_SLV_DWIDTH-1) := (others => '0');
    heater_output           : out std_logic_vector(0 to C_SLV_DWIDTH-1)
  );

  attribute SIGIS : string;
  attribute SIGIS of clk    : signal is "CLK";
  attribute SIGIS of reset  : signal is "RST";
  
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of heater : entity is "true";
  
end entity heater;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of heater is
  signal offset								 : integer;
  constant C_MAX_OFFSET                 : integer := C_NUM_LUTS - 31;

  signal inout_bit 	 : std_logic;
  signal inout_vector : std_logic_vector (C_NUM_LUTS downto 0) := (others=>'0');
  signal and_value	 :	std_logic;
	
  signal direction : std_logic_vector(32 downto 0) := (others => '0');

  attribute keep : string;
  attribute keep of inout_vector : signal is "true";
  attribute keep of IMP : architecture is "true";
  
  constant block_items : integer := C_NUM_LUTS / 32;
  signal N_heaters : integer;
  signal enable_vector : std_logic_vector (C_NUM_LUTS - 1 downto 0);
  
begin

  init_proc : process( adjust_heaters, enable_heater ) is
  begin
    for i in 0 to 31 loop
      for j in 0 to block_items - 1 loop
        enable_vector(block_items * i + j) <= adjust_heaters(i) and enable_heater;
      end loop;
    end loop;
  end process init_proc;


  luts : for bit_index in 0 to C_NUM_LUTS - 1 generate
  begin
    
    lut_osc : entity work.lut_oscilator
      port map (	en 	=> enable_vector(bit_index),
                        Q       => inout_vector(bit_index));
		
  end generate luts;

  
  offset <= conv_integer(read_which_heater);

  output_proc : process( clk,inout_vector,offset ) is
  begin
    if rising_edge(clk) then
      heater_output <= inout_vector(C_NUM_LUTS - offset - 1 downto C_NUM_LUTS - offset - 32);
    end if;
  end process output_proc;
  
end IMP;



library ieee;
use ieee.std_logic_1164.all;

entity ccitt16_testbench is
	end ccitt16_testbench;

architecture behavior of ccitt16_testbench is
	component ccitt16 is 
		port (  input: in std_logic_vector(31 downto 0);
			remainder: in std_logic_vector(15 downto 0);
			output: out std_logic_vector(15 downto 0)
		);
	end component;
	signal input : std_logic_vector(31 downto 0):=x"00000041";
	signal remainder: std_logic_vector(15 downto 0):=x"0000";
	signal output: std_logic_vector(15 downto 0); 
begin
	ccitt16_ins: ccitt16 port map (
	input => input,
	remainder => remainder,
	output => output);


	process
	begin
		input<=x"00000041";
		remainder <=x"0000";
		wait for 1 ns;
		report("Input :");
		report to_string(input);
		report ("crc value :");
		report to_string(output);
		input<=x"00000041";
		remainder <=x"56f5";		
		wait for 1 ns;
		report("check same crc value");
		report("Input: ");
		report to_string(input);
		report("reminder: ");
		report to_string(remainder);
		report("all zeros means correct");
		report to_string(output);
		
		wait;
	end process;
end behavior;

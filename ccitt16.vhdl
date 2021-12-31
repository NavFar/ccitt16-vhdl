library ieee;

use ieee.std_logic_1164.all;

package types_and_constants is
	constant POLY :std_logic_vector(15 downto 0):= x"1021";
	type array_of_logic_vector is array(48 downto 0) of std_logic_vector(15 downto 0);
end;
library ieee;
use ieee.std_logic_1164.all;
use work.types_and_constants.all;


entity ccitt16 is
	port (  input: in std_logic_vector(31 downto 0);
		remainder: in std_logic_vector(15 downto 0);
		output: out std_logic_vector(15 downto 0)
	);
end ccitt16;

architecture structural of ccitt16 is
	signal augmentedInput: std_logic_vector(47 downto 0);
	signal midterms: array_of_logic_vector;
begin

	augmentedInput(47 downto 16) <= input;
	augmentedInput(15 downto 0) <= remainder;
	midterms(48)<= x"ffff";

	--midterms(47) <=  (midterms(48)(14 downto 0) & augmentedInput(47 downto 47)) xor POLY when midterms(48)(15)='1' else
--				       	midterms(48)(14 downto 0) & augmentedInput(47 downto 47);



	generate_augmented_input_bits_for: for i in 0 to 47 
	
	generate
		
		midterms(48 - i -1) <=  (midterms(48 -i)(14 downto 0) & augmentedInput(47-i downto 47-i)) xor POLY when midterms(48-i)(15)='1' else
				       	midterms(48 -i)(14 downto 0) & augmentedInput(47-i downto 47-i);

	
	
	end generate;
	output <= midterms(0);
end structural;

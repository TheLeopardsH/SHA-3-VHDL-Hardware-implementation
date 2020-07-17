--F Function of SHA-3
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.keccakVar.all;

entity F_function is
		--generic(i:integer:=5;
		--		  j:integer:=5;
		--		  k:integer:=64
		--		  );
		port(
			 F_function_in : in array3D_state;
			 F_function_out : out array3D_state
			 );
end F_function;

architecture F_function_compute of F_function is		
		signal theta_in,pi_in,rho_in,chi_in,iota_in,theta_out,pi_out,rho_out,chi_out,iota_out : array3D_state ;
		signal array_2D : array2D;
		begin
			theta_in<=F_function_in;
			pi_in<=rho_out;
			rho_in<=theta_out;
			chi_in<=pi_out;
			iota_in<=chi_out;
			F_function_out<=iota_out;
			
			-- pi Pi: Permutate the 64 bit words
			--# aout[j'][2i′ + 3j′][k] = ain[i′][j′][k]
pi1: for x in 0 to 4 generate
	pi2: for y in 0 to 4 generate
		pi3: for z in 0 to 63 generate
			pi_out(y)((2*x+3*y) mod 5)(z)<=pi_in(x)(y)(z);
		end generate;	
	end generate;
end generate;
		
end F_function_compute;
			  
				  

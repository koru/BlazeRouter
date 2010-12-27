----------------------------------------------------------------------------------
-- Company:			 University of Nevada, Las Vegas 
-- Engineer: 		 Krikor Hovasapian (ECE Graduate Student)
-- 					 Kareem Matariyeh (ECE Graduate Student)
-- Create Date:    13:54:10 12/20/2010 
-- Design Name: 	 BlazeRouter
-- Module Name:    LinkController - RTL 
-- Project Name: 	 BlazeRouter
-- Target Devices: xc4vsx35-10ff668
-- Tool versions:  Using ISE 10.1.03
-- Description: 
--						 Part of the BlazeRouter design, the LinkController establishes
--						 and synchronizes with adjacent routers by asserting or rejecting
--						 incoming transfers through the (N,S,E,W) ports. 
--
-- Dependencies: 
--						 None
-- Revision: 
-- 					 Revision 0.01 - File Created
--						 Revision 0.02 - Added additional modules (KVH)
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.router_library.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LinkController is
    port ( rxr 				: in  std_logic;										--Receive Ready
			  txr 				: out  std_logic;									   --Transmission Request
			  data				: inout std_logic_vector(WIDTH downto 0);		--Data to/from neighbor	
			  data_local		: inout std_logic_vector(WIDTH downto 0);		--Data to/from buffer
			  buffer_en			: out std_logic;										--Enables/Disables Buffer to grab data from N,S,W,E
			  status				: in  std_logic_vector(WIDTH downto 0));		--Gets status on buffer (i.e: FULL/VACANT_SLOT)
end LinkController;

architecture rtl of LinkController is

begin
	lcproc: process(rxr, data)
	begin
		case rxr is
			when '1' =>
				data <= "00000001" after 1 ns;
			when others =>
				data <= "00000000" after 1 ns;
		end case;
	end process;
end rtl;


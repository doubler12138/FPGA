-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "12/05/2018 17:12:29"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          sha256
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY sha256_vhd_vec_tst IS
END sha256_vhd_vec_tst;
ARCHITECTURE sha256_arch OF sha256_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL debug_port : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL enable : STD_LOGIC;
SIGNAL hash_output : STD_LOGIC_VECTOR(255 DOWNTO 0);
SIGNAL ready : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL update : STD_LOGIC;
SIGNAL word_address : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL word_input : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT sha256
	PORT (
	clk : IN STD_LOGIC;
	debug_port : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	enable : IN STD_LOGIC;
	hash_output : BUFFER STD_LOGIC_VECTOR(255 DOWNTO 0);
	ready : BUFFER STD_LOGIC;
	reset : IN STD_LOGIC;
	update : IN STD_LOGIC;
	word_address : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	word_input : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : sha256
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	debug_port => debug_port,
	enable => enable,
	hash_output => hash_output,
	ready => ready,
	reset => reset,
	update => update,
	word_address => word_address,
	word_input => word_input
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- enable
t_prcs_enable: PROCESS
BEGIN
	enable <= '1';
WAIT;
END PROCESS t_prcs_enable;

-- reset
t_prcs_reset: PROCESS
BEGIN
LOOP
	reset <= '0';
	WAIT FOR 5000 ps;
	reset <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_reset;

-- update
t_prcs_update: PROCESS
BEGIN
	update <= '0';
WAIT;
END PROCESS t_prcs_update;
-- word_input[31]
t_prcs_word_input_31: PROCESS
BEGIN
	word_input(31) <= '0';
WAIT;
END PROCESS t_prcs_word_input_31;
-- word_input[30]
t_prcs_word_input_30: PROCESS
BEGIN
	word_input(30) <= '1';
WAIT;
END PROCESS t_prcs_word_input_30;
-- word_input[29]
t_prcs_word_input_29: PROCESS
BEGIN
	word_input(29) <= '1';
WAIT;
END PROCESS t_prcs_word_input_29;
-- word_input[28]
t_prcs_word_input_28: PROCESS
BEGIN
	word_input(28) <= '0';
WAIT;
END PROCESS t_prcs_word_input_28;
-- word_input[27]
t_prcs_word_input_27: PROCESS
BEGIN
	word_input(27) <= '1';
WAIT;
END PROCESS t_prcs_word_input_27;
-- word_input[26]
t_prcs_word_input_26: PROCESS
BEGIN
	word_input(26) <= '1';
WAIT;
END PROCESS t_prcs_word_input_26;
-- word_input[25]
t_prcs_word_input_25: PROCESS
BEGIN
	word_input(25) <= '0';
WAIT;
END PROCESS t_prcs_word_input_25;
-- word_input[24]
t_prcs_word_input_24: PROCESS
BEGIN
	word_input(24) <= '1';
WAIT;
END PROCESS t_prcs_word_input_24;
-- word_input[23]
t_prcs_word_input_23: PROCESS
BEGIN
	word_input(23) <= '0';
WAIT;
END PROCESS t_prcs_word_input_23;
-- word_input[22]
t_prcs_word_input_22: PROCESS
BEGIN
	word_input(22) <= '1';
WAIT;
END PROCESS t_prcs_word_input_22;
-- word_input[21]
t_prcs_word_input_21: PROCESS
BEGIN
	word_input(21) <= '1';
WAIT;
END PROCESS t_prcs_word_input_21;
-- word_input[20]
t_prcs_word_input_20: PROCESS
BEGIN
	word_input(20) <= '0';
WAIT;
END PROCESS t_prcs_word_input_20;
-- word_input[19]
t_prcs_word_input_19: PROCESS
BEGIN
	word_input(19) <= '1';
WAIT;
END PROCESS t_prcs_word_input_19;
-- word_input[18]
t_prcs_word_input_18: PROCESS
BEGIN
	word_input(18) <= '1';
WAIT;
END PROCESS t_prcs_word_input_18;
-- word_input[17]
t_prcs_word_input_17: PROCESS
BEGIN
	word_input(17) <= '1';
WAIT;
END PROCESS t_prcs_word_input_17;
-- word_input[16]
t_prcs_word_input_16: PROCESS
BEGIN
	word_input(16) <= '0';
WAIT;
END PROCESS t_prcs_word_input_16;
-- word_input[15]
t_prcs_word_input_15: PROCESS
BEGIN
	word_input(15) <= '0';
WAIT;
END PROCESS t_prcs_word_input_15;
-- word_input[14]
t_prcs_word_input_14: PROCESS
BEGIN
	word_input(14) <= '1';
WAIT;
END PROCESS t_prcs_word_input_14;
-- word_input[13]
t_prcs_word_input_13: PROCESS
BEGIN
	word_input(13) <= '1';
WAIT;
END PROCESS t_prcs_word_input_13;
-- word_input[12]
t_prcs_word_input_12: PROCESS
BEGIN
	word_input(12) <= '0';
WAIT;
END PROCESS t_prcs_word_input_12;
-- word_input[11]
t_prcs_word_input_11: PROCESS
BEGIN
	word_input(11) <= '1';
WAIT;
END PROCESS t_prcs_word_input_11;
-- word_input[10]
t_prcs_word_input_10: PROCESS
BEGIN
	word_input(10) <= '1';
WAIT;
END PROCESS t_prcs_word_input_10;
-- word_input[9]
t_prcs_word_input_9: PROCESS
BEGIN
	word_input(9) <= '1';
WAIT;
END PROCESS t_prcs_word_input_9;
-- word_input[8]
t_prcs_word_input_8: PROCESS
BEGIN
	word_input(8) <= '1';
WAIT;
END PROCESS t_prcs_word_input_8;
-- word_input[7]
t_prcs_word_input_7: PROCESS
BEGIN
	word_input(7) <= '0';
WAIT;
END PROCESS t_prcs_word_input_7;
-- word_input[6]
t_prcs_word_input_6: PROCESS
BEGIN
	word_input(6) <= '1';
WAIT;
END PROCESS t_prcs_word_input_6;
-- word_input[5]
t_prcs_word_input_5: PROCESS
BEGIN
	word_input(5) <= '1';
WAIT;
END PROCESS t_prcs_word_input_5;
-- word_input[4]
t_prcs_word_input_4: PROCESS
BEGIN
	word_input(4) <= '1';
WAIT;
END PROCESS t_prcs_word_input_4;
-- word_input[3]
t_prcs_word_input_3: PROCESS
BEGIN
	word_input(3) <= '0';
WAIT;
END PROCESS t_prcs_word_input_3;
-- word_input[2]
t_prcs_word_input_2: PROCESS
BEGIN
	word_input(2) <= '0';
WAIT;
END PROCESS t_prcs_word_input_2;
-- word_input[1]
t_prcs_word_input_1: PROCESS
BEGIN
	word_input(1) <= '0';
WAIT;
END PROCESS t_prcs_word_input_1;
-- word_input[0]
t_prcs_word_input_0: PROCESS
BEGIN
	word_input(0) <= '0';
WAIT;
END PROCESS t_prcs_word_input_0;
END sha256_arch;

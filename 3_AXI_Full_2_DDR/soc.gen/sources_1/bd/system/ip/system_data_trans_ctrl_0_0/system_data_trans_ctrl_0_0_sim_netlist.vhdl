-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Sat Jun 21 15:05:03 2025
-- Host        : DESKTOP-K54KI5V running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/tzh/Desktop/PLL_ADC_Capture-2-ETH/3_AXI_Full_2_DDR_ETH_20250318_tzh_board/soc.gen/sources_1/bd/system/ip/system_data_trans_ctrl_0_0/system_data_trans_ctrl_0_0_sim_netlist.vhdl
-- Design      : system_data_trans_ctrl_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z015clg485-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_data_trans_ctrl_0_0_data_trans_ctrl is
  port (
    \user_rd_addr_reg[30]_0\ : out STD_LOGIC;
    read_task_busy_reg_0 : out STD_LOGIC;
    user_wr_addr : out STD_LOGIC_VECTOR ( 23 downto 0 );
    user_wr_last_reg_0 : out STD_LOGIC;
    \user_wr_addr_reg[30]_0\ : out STD_LOGIC;
    write_task_busy_reg_0 : out STD_LOGIC;
    user_rd_addr : out STD_LOGIC_VECTOR ( 23 downto 0 );
    user_write_vld : out STD_LOGIC;
    user_read_vld : out STD_LOGIC;
    user_wr_length : out STD_LOGIC_VECTOR ( 0 to 0 );
    user_rd_length : out STD_LOGIC_VECTOR ( 0 to 0 );
    write_signal : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    read_signal : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    user_rd_last : in STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of system_data_trans_ctrl_0_0_data_trans_ctrl : entity is "data_trans_ctrl";
end system_data_trans_ctrl_0_0_data_trans_ctrl;

architecture STRUCTURE of system_data_trans_ctrl_0_0_data_trans_ctrl is
  signal p_0_in : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal p_2_in : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \rd_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal \rd_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \rd_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \rd_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal rd_cnt_reg : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal \rd_cnt_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \rd_cnt_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \rd_cnt_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \rd_cnt_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \rd_cnt_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \rd_cnt_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \rd_cnt_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \rd_cnt_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \rd_cnt_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \rd_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \rd_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \rd_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \rd_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \rd_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \rd_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \rd_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \rd_cnt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \rd_cnt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \rd_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \rd_cnt_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \rd_cnt_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \rd_cnt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \rd_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \rd_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \rd_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \rd_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \rd_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \rd_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \rd_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \rd_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \rd_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \rd_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \rd_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \rd_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \rd_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \rd_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \rd_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \rd_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \rd_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal read_done_INST_0_i_1_n_0 : STD_LOGIC;
  signal read_done_INST_0_i_2_n_0 : STD_LOGIC;
  signal read_done_INST_0_i_3_n_0 : STD_LOGIC;
  signal read_done_INST_0_i_4_n_0 : STD_LOGIC;
  signal read_done_INST_0_i_5_n_0 : STD_LOGIC;
  signal read_done_INST_0_i_6_n_0 : STD_LOGIC;
  signal read_signal_d0 : STD_LOGIC;
  signal read_task_busy_i_1_n_0 : STD_LOGIC;
  signal \^read_task_busy_reg_0\ : STD_LOGIC;
  signal \^user_rd_addr\ : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal \user_rd_addr0_carry__0_n_0\ : STD_LOGIC;
  signal \user_rd_addr0_carry__0_n_1\ : STD_LOGIC;
  signal \user_rd_addr0_carry__0_n_2\ : STD_LOGIC;
  signal \user_rd_addr0_carry__0_n_3\ : STD_LOGIC;
  signal \user_rd_addr0_carry__1_n_0\ : STD_LOGIC;
  signal \user_rd_addr0_carry__1_n_1\ : STD_LOGIC;
  signal \user_rd_addr0_carry__1_n_2\ : STD_LOGIC;
  signal \user_rd_addr0_carry__1_n_3\ : STD_LOGIC;
  signal \user_rd_addr0_carry__2_n_0\ : STD_LOGIC;
  signal \user_rd_addr0_carry__2_n_1\ : STD_LOGIC;
  signal \user_rd_addr0_carry__2_n_2\ : STD_LOGIC;
  signal \user_rd_addr0_carry__2_n_3\ : STD_LOGIC;
  signal \user_rd_addr0_carry__3_n_0\ : STD_LOGIC;
  signal \user_rd_addr0_carry__3_n_1\ : STD_LOGIC;
  signal \user_rd_addr0_carry__3_n_2\ : STD_LOGIC;
  signal \user_rd_addr0_carry__3_n_3\ : STD_LOGIC;
  signal \user_rd_addr0_carry__4_n_0\ : STD_LOGIC;
  signal \user_rd_addr0_carry__4_n_1\ : STD_LOGIC;
  signal \user_rd_addr0_carry__4_n_2\ : STD_LOGIC;
  signal \user_rd_addr0_carry__4_n_3\ : STD_LOGIC;
  signal user_rd_addr0_carry_i_1_n_0 : STD_LOGIC;
  signal user_rd_addr0_carry_n_0 : STD_LOGIC;
  signal user_rd_addr0_carry_n_1 : STD_LOGIC;
  signal user_rd_addr0_carry_n_2 : STD_LOGIC;
  signal user_rd_addr0_carry_n_3 : STD_LOGIC;
  signal \user_rd_addr[15]_i_1_n_0\ : STD_LOGIC;
  signal \user_rd_addr[18]_i_1_n_0\ : STD_LOGIC;
  signal \user_rd_addr[19]_i_1_n_0\ : STD_LOGIC;
  signal \user_rd_addr[31]_i_1_n_0\ : STD_LOGIC;
  signal \^user_rd_addr_reg[30]_0\ : STD_LOGIC;
  signal \user_rd_length[8]_i_1_n_0\ : STD_LOGIC;
  signal \^user_read_vld\ : STD_LOGIC;
  signal user_read_vld_i_1_n_0 : STD_LOGIC;
  signal user_read_vld_i_2_n_0 : STD_LOGIC;
  signal user_read_vld_i_3_n_0 : STD_LOGIC;
  signal user_read_vld_i_4_n_0 : STD_LOGIC;
  signal user_read_vld_i_5_n_0 : STD_LOGIC;
  signal \^user_wr_addr\ : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal \user_wr_addr0_carry__0_n_0\ : STD_LOGIC;
  signal \user_wr_addr0_carry__0_n_1\ : STD_LOGIC;
  signal \user_wr_addr0_carry__0_n_2\ : STD_LOGIC;
  signal \user_wr_addr0_carry__0_n_3\ : STD_LOGIC;
  signal \user_wr_addr0_carry__1_n_0\ : STD_LOGIC;
  signal \user_wr_addr0_carry__1_n_1\ : STD_LOGIC;
  signal \user_wr_addr0_carry__1_n_2\ : STD_LOGIC;
  signal \user_wr_addr0_carry__1_n_3\ : STD_LOGIC;
  signal \user_wr_addr0_carry__2_n_0\ : STD_LOGIC;
  signal \user_wr_addr0_carry__2_n_1\ : STD_LOGIC;
  signal \user_wr_addr0_carry__2_n_2\ : STD_LOGIC;
  signal \user_wr_addr0_carry__2_n_3\ : STD_LOGIC;
  signal \user_wr_addr0_carry__3_n_0\ : STD_LOGIC;
  signal \user_wr_addr0_carry__3_n_1\ : STD_LOGIC;
  signal \user_wr_addr0_carry__3_n_2\ : STD_LOGIC;
  signal \user_wr_addr0_carry__3_n_3\ : STD_LOGIC;
  signal \user_wr_addr0_carry__4_n_0\ : STD_LOGIC;
  signal \user_wr_addr0_carry__4_n_1\ : STD_LOGIC;
  signal \user_wr_addr0_carry__4_n_2\ : STD_LOGIC;
  signal \user_wr_addr0_carry__4_n_3\ : STD_LOGIC;
  signal user_wr_addr0_carry_i_1_n_0 : STD_LOGIC;
  signal user_wr_addr0_carry_n_0 : STD_LOGIC;
  signal user_wr_addr0_carry_n_1 : STD_LOGIC;
  signal user_wr_addr0_carry_n_2 : STD_LOGIC;
  signal user_wr_addr0_carry_n_3 : STD_LOGIC;
  signal \user_wr_addr[15]_i_1_n_0\ : STD_LOGIC;
  signal \user_wr_addr[18]_i_1_n_0\ : STD_LOGIC;
  signal \user_wr_addr[19]_i_1_n_0\ : STD_LOGIC;
  signal \user_wr_addr[31]_i_1_n_0\ : STD_LOGIC;
  signal \^user_wr_addr_reg[30]_0\ : STD_LOGIC;
  signal user_wr_last_i_1_n_0 : STD_LOGIC;
  signal user_wr_last_i_2_n_0 : STD_LOGIC;
  signal user_wr_last_i_3_n_0 : STD_LOGIC;
  signal user_wr_last_i_4_n_0 : STD_LOGIC;
  signal user_wr_last_i_5_n_0 : STD_LOGIC;
  signal \^user_wr_last_reg_0\ : STD_LOGIC;
  signal \user_wr_length[8]_i_1_n_0\ : STD_LOGIC;
  signal \^user_write_vld\ : STD_LOGIC;
  signal user_write_vld1 : STD_LOGIC;
  signal user_write_vld_i_1_n_0 : STD_LOGIC;
  signal user_write_vld_i_2_n_0 : STD_LOGIC;
  signal user_write_vld_i_3_n_0 : STD_LOGIC;
  signal user_write_vld_i_4_n_0 : STD_LOGIC;
  signal user_write_vld_i_6_n_0 : STD_LOGIC;
  signal user_write_vld_i_7_n_0 : STD_LOGIC;
  signal user_write_vld_i_8_n_0 : STD_LOGIC;
  signal user_write_vld_i_9_n_0 : STD_LOGIC;
  signal \wr_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \wr_cnt[0]_i_3_n_0\ : STD_LOGIC;
  signal \wr_cnt[0]_i_4_n_0\ : STD_LOGIC;
  signal \wr_cnt[0]_i_5_n_0\ : STD_LOGIC;
  signal \wr_cnt[0]_i_6_n_0\ : STD_LOGIC;
  signal wr_cnt_reg : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal \wr_cnt_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \wr_cnt_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \wr_cnt_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \wr_cnt_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \wr_cnt_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \wr_cnt_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \wr_cnt_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \wr_cnt_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \wr_cnt_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \wr_cnt_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \wr_cnt_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \wr_cnt_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \wr_cnt_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \wr_cnt_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \wr_cnt_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \wr_cnt_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \wr_cnt_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \wr_cnt_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \wr_cnt_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \wr_cnt_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \wr_cnt_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \wr_cnt_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \wr_cnt_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \wr_cnt_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wr_cnt_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \wr_cnt_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \wr_cnt_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \wr_cnt_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \wr_cnt_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \wr_cnt_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \wr_cnt_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \wr_cnt_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \wr_cnt_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \wr_cnt_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \wr_cnt_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \wr_cnt_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \wr_cnt_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \wr_cnt_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \wr_cnt_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \wr_reset_timer[2]_i_1_n_0\ : STD_LOGIC;
  signal \wr_reset_timer[4]_i_1_n_0\ : STD_LOGIC;
  signal \wr_reset_timer[9]_i_1_n_0\ : STD_LOGIC;
  signal \wr_reset_timer[9]_i_2_n_0\ : STD_LOGIC;
  signal \wr_reset_timer[9]_i_4_n_0\ : STD_LOGIC;
  signal \wr_reset_timer[9]_i_5_n_0\ : STD_LOGIC;
  signal wr_reset_timer_reg : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal wr_rst_n_sync : STD_LOGIC;
  signal wr_rst_n_sync_i_1_n_0 : STD_LOGIC;
  signal write_done_INST_0_i_1_n_0 : STD_LOGIC;
  signal write_done_INST_0_i_2_n_0 : STD_LOGIC;
  signal write_done_INST_0_i_3_n_0 : STD_LOGIC;
  signal write_done_INST_0_i_4_n_0 : STD_LOGIC;
  signal write_done_INST_0_i_5_n_0 : STD_LOGIC;
  signal write_done_INST_0_i_6_n_0 : STD_LOGIC;
  signal write_signal_d0 : STD_LOGIC;
  signal write_task_busy_i_1_n_0 : STD_LOGIC;
  signal \^write_task_busy_reg_0\ : STD_LOGIC;
  signal \NLW_rd_cnt_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_user_rd_addr0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_user_rd_addr0_carry__5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_user_rd_addr0_carry__5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_user_wr_addr0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_user_wr_addr0_carry__5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_user_wr_addr0_carry__5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_wr_cnt_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \rd_cnt_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \rd_cnt_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rd_cnt_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rd_cnt_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rd_cnt_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of read_task_busy_i_1 : label is "soft_lutpair5";
  attribute ADDER_THRESHOLD of user_rd_addr0_carry : label is 35;
  attribute ADDER_THRESHOLD of \user_rd_addr0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \user_rd_addr0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \user_rd_addr0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \user_rd_addr0_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \user_rd_addr0_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \user_rd_addr0_carry__5\ : label is 35;
  attribute SOFT_HLUTNM of \user_rd_length[8]_i_1\ : label is "soft_lutpair5";
  attribute ADDER_THRESHOLD of user_wr_addr0_carry : label is 35;
  attribute ADDER_THRESHOLD of \user_wr_addr0_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \user_wr_addr0_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \user_wr_addr0_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \user_wr_addr0_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \user_wr_addr0_carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \user_wr_addr0_carry__5\ : label is 35;
  attribute SOFT_HLUTNM of user_wr_last_i_4 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of user_wr_last_i_5 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of user_write_vld_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of user_write_vld_i_4 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of user_write_vld_i_5 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of user_write_vld_i_6 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of user_write_vld_i_9 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \wr_cnt[0]_i_4\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \wr_cnt[0]_i_5\ : label is "soft_lutpair7";
  attribute ADDER_THRESHOLD of \wr_cnt_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \wr_cnt_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \wr_cnt_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \wr_cnt_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \wr_cnt_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of \wr_reset_timer[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \wr_reset_timer[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \wr_reset_timer[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wr_reset_timer[4]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \wr_reset_timer[6]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \wr_reset_timer[7]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \wr_reset_timer[8]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wr_reset_timer[9]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of write_task_busy_i_1 : label is "soft_lutpair4";
begin
  read_task_busy_reg_0 <= \^read_task_busy_reg_0\;
  user_rd_addr(23 downto 0) <= \^user_rd_addr\(23 downto 0);
  \user_rd_addr_reg[30]_0\ <= \^user_rd_addr_reg[30]_0\;
  user_read_vld <= \^user_read_vld\;
  user_wr_addr(23 downto 0) <= \^user_wr_addr\(23 downto 0);
  \user_wr_addr_reg[30]_0\ <= \^user_wr_addr_reg[30]_0\;
  user_wr_last_reg_0 <= \^user_wr_last_reg_0\;
  user_write_vld <= \^user_write_vld\;
  write_task_busy_reg_0 <= \^write_task_busy_reg_0\;
\rd_cnt[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100FFFFFFFFFFFF"
    )
        port map (
      I0 => \rd_cnt[0]_i_3_n_0\,
      I1 => \rd_cnt[0]_i_4_n_0\,
      I2 => \rd_cnt[0]_i_5_n_0\,
      I3 => user_read_vld_i_3_n_0,
      I4 => wr_rst_n_sync,
      I5 => \^read_task_busy_reg_0\,
      O => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFFFFFFFFFFF"
    )
        port map (
      I0 => rd_cnt_reg(7),
      I1 => rd_cnt_reg(6),
      I2 => rd_cnt_reg(0),
      I3 => rd_cnt_reg(4),
      I4 => rd_cnt_reg(15),
      I5 => rd_cnt_reg(2),
      O => \rd_cnt[0]_i_3_n_0\
    );
\rd_cnt[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => rd_cnt_reg(1),
      I1 => rd_cnt_reg(5),
      I2 => rd_cnt_reg(3),
      I3 => rd_cnt_reg(8),
      O => \rd_cnt[0]_i_4_n_0\
    );
\rd_cnt[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => rd_cnt_reg(17),
      I1 => rd_cnt_reg(16),
      I2 => rd_cnt_reg(18),
      I3 => rd_cnt_reg(19),
      O => \rd_cnt[0]_i_5_n_0\
    );
\rd_cnt[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rd_cnt_reg(0),
      O => \rd_cnt[0]_i_6_n_0\
    );
\rd_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[0]_i_2_n_7\,
      Q => rd_cnt_reg(0),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \rd_cnt_reg[0]_i_2_n_0\,
      CO(2) => \rd_cnt_reg[0]_i_2_n_1\,
      CO(1) => \rd_cnt_reg[0]_i_2_n_2\,
      CO(0) => \rd_cnt_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \rd_cnt_reg[0]_i_2_n_4\,
      O(2) => \rd_cnt_reg[0]_i_2_n_5\,
      O(1) => \rd_cnt_reg[0]_i_2_n_6\,
      O(0) => \rd_cnt_reg[0]_i_2_n_7\,
      S(3 downto 1) => rd_cnt_reg(3 downto 1),
      S(0) => \rd_cnt[0]_i_6_n_0\
    );
\rd_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[8]_i_1_n_5\,
      Q => rd_cnt_reg(10),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[8]_i_1_n_4\,
      Q => rd_cnt_reg(11),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[12]_i_1_n_7\,
      Q => rd_cnt_reg(12),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_cnt_reg[8]_i_1_n_0\,
      CO(3) => \rd_cnt_reg[12]_i_1_n_0\,
      CO(2) => \rd_cnt_reg[12]_i_1_n_1\,
      CO(1) => \rd_cnt_reg[12]_i_1_n_2\,
      CO(0) => \rd_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rd_cnt_reg[12]_i_1_n_4\,
      O(2) => \rd_cnt_reg[12]_i_1_n_5\,
      O(1) => \rd_cnt_reg[12]_i_1_n_6\,
      O(0) => \rd_cnt_reg[12]_i_1_n_7\,
      S(3 downto 0) => rd_cnt_reg(15 downto 12)
    );
\rd_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[12]_i_1_n_6\,
      Q => rd_cnt_reg(13),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[12]_i_1_n_5\,
      Q => rd_cnt_reg(14),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[12]_i_1_n_4\,
      Q => rd_cnt_reg(15),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[16]_i_1_n_7\,
      Q => rd_cnt_reg(16),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_cnt_reg[12]_i_1_n_0\,
      CO(3) => \NLW_rd_cnt_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \rd_cnt_reg[16]_i_1_n_1\,
      CO(1) => \rd_cnt_reg[16]_i_1_n_2\,
      CO(0) => \rd_cnt_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rd_cnt_reg[16]_i_1_n_4\,
      O(2) => \rd_cnt_reg[16]_i_1_n_5\,
      O(1) => \rd_cnt_reg[16]_i_1_n_6\,
      O(0) => \rd_cnt_reg[16]_i_1_n_7\,
      S(3 downto 0) => rd_cnt_reg(19 downto 16)
    );
\rd_cnt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[16]_i_1_n_6\,
      Q => rd_cnt_reg(17),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[16]_i_1_n_5\,
      Q => rd_cnt_reg(18),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[16]_i_1_n_4\,
      Q => rd_cnt_reg(19),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[0]_i_2_n_6\,
      Q => rd_cnt_reg(1),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[0]_i_2_n_5\,
      Q => rd_cnt_reg(2),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[0]_i_2_n_4\,
      Q => rd_cnt_reg(3),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[4]_i_1_n_7\,
      Q => rd_cnt_reg(4),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_cnt_reg[0]_i_2_n_0\,
      CO(3) => \rd_cnt_reg[4]_i_1_n_0\,
      CO(2) => \rd_cnt_reg[4]_i_1_n_1\,
      CO(1) => \rd_cnt_reg[4]_i_1_n_2\,
      CO(0) => \rd_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rd_cnt_reg[4]_i_1_n_4\,
      O(2) => \rd_cnt_reg[4]_i_1_n_5\,
      O(1) => \rd_cnt_reg[4]_i_1_n_6\,
      O(0) => \rd_cnt_reg[4]_i_1_n_7\,
      S(3 downto 0) => rd_cnt_reg(7 downto 4)
    );
\rd_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[4]_i_1_n_6\,
      Q => rd_cnt_reg(5),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[4]_i_1_n_5\,
      Q => rd_cnt_reg(6),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[4]_i_1_n_4\,
      Q => rd_cnt_reg(7),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[8]_i_1_n_7\,
      Q => rd_cnt_reg(8),
      R => \rd_cnt[0]_i_1_n_0\
    );
\rd_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rd_cnt_reg[4]_i_1_n_0\,
      CO(3) => \rd_cnt_reg[8]_i_1_n_0\,
      CO(2) => \rd_cnt_reg[8]_i_1_n_1\,
      CO(1) => \rd_cnt_reg[8]_i_1_n_2\,
      CO(0) => \rd_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rd_cnt_reg[8]_i_1_n_4\,
      O(2) => \rd_cnt_reg[8]_i_1_n_5\,
      O(1) => \rd_cnt_reg[8]_i_1_n_6\,
      O(0) => \rd_cnt_reg[8]_i_1_n_7\,
      S(3 downto 0) => rd_cnt_reg(11 downto 8)
    );
\rd_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \rd_cnt_reg[8]_i_1_n_6\,
      Q => rd_cnt_reg(9),
      R => \rd_cnt[0]_i_1_n_0\
    );
read_done_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => read_done_INST_0_i_1_n_0,
      I1 => read_done_INST_0_i_2_n_0,
      I2 => read_done_INST_0_i_3_n_0,
      I3 => read_done_INST_0_i_4_n_0,
      I4 => read_done_INST_0_i_5_n_0,
      I5 => read_done_INST_0_i_6_n_0,
      O => \^user_rd_addr_reg[30]_0\
    );
read_done_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^user_rd_addr\(22),
      I1 => \^user_rd_addr\(18),
      I2 => \^user_rd_addr\(9),
      I3 => \^user_rd_addr\(3),
      O => read_done_INST_0_i_1_n_0
    );
read_done_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \^user_rd_addr\(23),
      I1 => \^user_rd_addr\(15),
      I2 => \^user_rd_addr\(11),
      I3 => \^user_rd_addr\(17),
      O => read_done_INST_0_i_2_n_0
    );
read_done_INST_0_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => user_rd_last,
      I1 => \^user_rd_addr\(10),
      I2 => \^user_rd_addr\(1),
      O => read_done_INST_0_i_3_n_0
    );
read_done_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^user_rd_addr\(6),
      I1 => \^user_rd_addr\(21),
      I2 => \^user_rd_addr\(20),
      I3 => \^user_rd_addr\(14),
      O => read_done_INST_0_i_4_n_0
    );
read_done_INST_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^user_rd_addr\(5),
      I1 => \^user_rd_addr\(4),
      I2 => \^user_rd_addr\(13),
      I3 => \^user_rd_addr\(0),
      O => read_done_INST_0_i_5_n_0
    );
read_done_INST_0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFFFFF"
    )
        port map (
      I0 => \^user_rd_addr\(19),
      I1 => \^user_rd_addr\(2),
      I2 => \^user_rd_addr\(12),
      I3 => \^user_rd_addr\(16),
      I4 => \^user_rd_addr\(8),
      I5 => \^user_rd_addr\(7),
      O => read_done_INST_0_i_6_n_0
    );
read_signal_d0_reg: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => read_signal,
      Q => read_signal_d0,
      R => '0'
    );
read_task_busy_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22F20000"
    )
        port map (
      I0 => \^read_task_busy_reg_0\,
      I1 => \^user_rd_addr_reg[30]_0\,
      I2 => read_signal,
      I3 => read_signal_d0,
      I4 => wr_rst_n_sync,
      O => read_task_busy_i_1_n_0
    );
read_task_busy_reg: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => read_task_busy_i_1_n_0,
      Q => \^read_task_busy_reg_0\,
      R => '0'
    );
user_rd_addr0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => user_rd_addr0_carry_n_0,
      CO(2) => user_rd_addr0_carry_n_1,
      CO(1) => user_rd_addr0_carry_n_2,
      CO(0) => user_rd_addr0_carry_n_3,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \^user_rd_addr\(0),
      DI(0) => '0',
      O(3 downto 1) => p_1_in(10 downto 8),
      O(0) => NLW_user_rd_addr0_carry_O_UNCONNECTED(0),
      S(3 downto 2) => \^user_rd_addr\(2 downto 1),
      S(1) => user_rd_addr0_carry_i_1_n_0,
      S(0) => '0'
    );
\user_rd_addr0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => user_rd_addr0_carry_n_0,
      CO(3) => \user_rd_addr0_carry__0_n_0\,
      CO(2) => \user_rd_addr0_carry__0_n_1\,
      CO(1) => \user_rd_addr0_carry__0_n_2\,
      CO(0) => \user_rd_addr0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(14 downto 11),
      S(3 downto 0) => \^user_rd_addr\(6 downto 3)
    );
\user_rd_addr0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \user_rd_addr0_carry__0_n_0\,
      CO(3) => \user_rd_addr0_carry__1_n_0\,
      CO(2) => \user_rd_addr0_carry__1_n_1\,
      CO(1) => \user_rd_addr0_carry__1_n_2\,
      CO(0) => \user_rd_addr0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(18 downto 15),
      S(3 downto 0) => \^user_rd_addr\(10 downto 7)
    );
\user_rd_addr0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \user_rd_addr0_carry__1_n_0\,
      CO(3) => \user_rd_addr0_carry__2_n_0\,
      CO(2) => \user_rd_addr0_carry__2_n_1\,
      CO(1) => \user_rd_addr0_carry__2_n_2\,
      CO(0) => \user_rd_addr0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(22 downto 19),
      S(3 downto 0) => \^user_rd_addr\(14 downto 11)
    );
\user_rd_addr0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \user_rd_addr0_carry__2_n_0\,
      CO(3) => \user_rd_addr0_carry__3_n_0\,
      CO(2) => \user_rd_addr0_carry__3_n_1\,
      CO(1) => \user_rd_addr0_carry__3_n_2\,
      CO(0) => \user_rd_addr0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(26 downto 23),
      S(3 downto 0) => \^user_rd_addr\(18 downto 15)
    );
\user_rd_addr0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \user_rd_addr0_carry__3_n_0\,
      CO(3) => \user_rd_addr0_carry__4_n_0\,
      CO(2) => \user_rd_addr0_carry__4_n_1\,
      CO(1) => \user_rd_addr0_carry__4_n_2\,
      CO(0) => \user_rd_addr0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_1_in(30 downto 27),
      S(3 downto 0) => \^user_rd_addr\(22 downto 19)
    );
\user_rd_addr0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \user_rd_addr0_carry__4_n_0\,
      CO(3 downto 0) => \NLW_user_rd_addr0_carry__5_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_user_rd_addr0_carry__5_O_UNCONNECTED\(3 downto 1),
      O(0) => p_1_in(31),
      S(3 downto 1) => B"000",
      S(0) => \^user_rd_addr\(23)
    );
user_rd_addr0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^user_rd_addr\(0),
      O => user_rd_addr0_carry_i_1_n_0
    );
\user_rd_addr[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FECE000000000000"
    )
        port map (
      I0 => \^user_rd_addr\(7),
      I1 => \^user_rd_addr_reg[30]_0\,
      I2 => user_rd_last,
      I3 => p_1_in(15),
      I4 => \^read_task_busy_reg_0\,
      I5 => wr_rst_n_sync,
      O => \user_rd_addr[15]_i_1_n_0\
    );
\user_rd_addr[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FECE000000000000"
    )
        port map (
      I0 => \^user_rd_addr\(10),
      I1 => \^user_rd_addr_reg[30]_0\,
      I2 => user_rd_last,
      I3 => p_1_in(18),
      I4 => \^read_task_busy_reg_0\,
      I5 => wr_rst_n_sync,
      O => \user_rd_addr[18]_i_1_n_0\
    );
\user_rd_addr[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FECE000000000000"
    )
        port map (
      I0 => \^user_rd_addr\(11),
      I1 => \^user_rd_addr_reg[30]_0\,
      I2 => user_rd_last,
      I3 => p_1_in(19),
      I4 => \^read_task_busy_reg_0\,
      I5 => wr_rst_n_sync,
      O => \user_rd_addr[19]_i_1_n_0\
    );
\user_rd_addr[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \^user_rd_addr_reg[30]_0\,
      I1 => wr_rst_n_sync,
      I2 => \^read_task_busy_reg_0\,
      O => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(10),
      Q => \^user_rd_addr\(2),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(11),
      Q => \^user_rd_addr\(3),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(12),
      Q => \^user_rd_addr\(4),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(13),
      Q => \^user_rd_addr\(5),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(14),
      Q => \^user_rd_addr\(6),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \user_rd_addr[15]_i_1_n_0\,
      Q => \^user_rd_addr\(7),
      R => '0'
    );
\user_rd_addr_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(16),
      Q => \^user_rd_addr\(8),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(17),
      Q => \^user_rd_addr\(9),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \user_rd_addr[18]_i_1_n_0\,
      Q => \^user_rd_addr\(10),
      R => '0'
    );
\user_rd_addr_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \user_rd_addr[19]_i_1_n_0\,
      Q => \^user_rd_addr\(11),
      R => '0'
    );
\user_rd_addr_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(20),
      Q => \^user_rd_addr\(12),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(21),
      Q => \^user_rd_addr\(13),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(22),
      Q => \^user_rd_addr\(14),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(23),
      Q => \^user_rd_addr\(15),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(24),
      Q => \^user_rd_addr\(16),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(25),
      Q => \^user_rd_addr\(17),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(26),
      Q => \^user_rd_addr\(18),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(27),
      Q => \^user_rd_addr\(19),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(28),
      Q => \^user_rd_addr\(20),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(29),
      Q => \^user_rd_addr\(21),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(30),
      Q => \^user_rd_addr\(22),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(31),
      Q => \^user_rd_addr\(23),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(8),
      Q => \^user_rd_addr\(0),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_addr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => user_rd_last,
      D => p_1_in(9),
      Q => \^user_rd_addr\(1),
      R => \user_rd_addr[31]_i_1_n_0\
    );
\user_rd_length[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^read_task_busy_reg_0\,
      I1 => wr_rst_n_sync,
      O => \user_rd_length[8]_i_1_n_0\
    );
\user_rd_length_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => \user_rd_length[8]_i_1_n_0\,
      Q => user_rd_length(0),
      R => '0'
    );
user_read_vld_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000088880800"
    )
        port map (
      I0 => wr_rst_n_sync,
      I1 => \^read_task_busy_reg_0\,
      I2 => user_read_vld_i_2_n_0,
      I3 => user_read_vld_i_3_n_0,
      I4 => \^user_read_vld\,
      I5 => user_rd_last,
      O => user_read_vld_i_1_n_0
    );
user_read_vld_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => user_read_vld_i_4_n_0,
      I1 => user_read_vld_i_5_n_0,
      I2 => rd_cnt_reg(5),
      I3 => rd_cnt_reg(8),
      I4 => rd_cnt_reg(0),
      I5 => \rd_cnt[0]_i_5_n_0\,
      O => user_read_vld_i_2_n_0
    );
user_read_vld_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => rd_cnt_reg(10),
      I1 => rd_cnt_reg(9),
      I2 => rd_cnt_reg(11),
      I3 => rd_cnt_reg(13),
      I4 => rd_cnt_reg(14),
      I5 => rd_cnt_reg(12),
      O => user_read_vld_i_3_n_0
    );
user_read_vld_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF4"
    )
        port map (
      I0 => rd_cnt_reg(7),
      I1 => rd_cnt_reg(6),
      I2 => rd_cnt_reg(1),
      I3 => rd_cnt_reg(2),
      O => user_read_vld_i_4_n_0
    );
user_read_vld_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => rd_cnt_reg(4),
      I1 => rd_cnt_reg(15),
      I2 => rd_cnt_reg(3),
      I3 => rd_cnt_reg(7),
      O => user_read_vld_i_5_n_0
    );
user_read_vld_reg: unisim.vcomponents.FDRE
     port map (
      C => rd_clk,
      CE => '1',
      D => user_read_vld_i_1_n_0,
      Q => \^user_read_vld\,
      R => '0'
    );
user_wr_addr0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => user_wr_addr0_carry_n_0,
      CO(2) => user_wr_addr0_carry_n_1,
      CO(1) => user_wr_addr0_carry_n_2,
      CO(0) => user_wr_addr0_carry_n_3,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => \^user_wr_addr\(0),
      DI(0) => '0',
      O(3 downto 1) => p_2_in(10 downto 8),
      O(0) => NLW_user_wr_addr0_carry_O_UNCONNECTED(0),
      S(3 downto 2) => \^user_wr_addr\(2 downto 1),
      S(1) => user_wr_addr0_carry_i_1_n_0,
      S(0) => '0'
    );
\user_wr_addr0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => user_wr_addr0_carry_n_0,
      CO(3) => \user_wr_addr0_carry__0_n_0\,
      CO(2) => \user_wr_addr0_carry__0_n_1\,
      CO(1) => \user_wr_addr0_carry__0_n_2\,
      CO(0) => \user_wr_addr0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_2_in(14 downto 11),
      S(3 downto 0) => \^user_wr_addr\(6 downto 3)
    );
\user_wr_addr0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \user_wr_addr0_carry__0_n_0\,
      CO(3) => \user_wr_addr0_carry__1_n_0\,
      CO(2) => \user_wr_addr0_carry__1_n_1\,
      CO(1) => \user_wr_addr0_carry__1_n_2\,
      CO(0) => \user_wr_addr0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_2_in(18 downto 15),
      S(3 downto 0) => \^user_wr_addr\(10 downto 7)
    );
\user_wr_addr0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \user_wr_addr0_carry__1_n_0\,
      CO(3) => \user_wr_addr0_carry__2_n_0\,
      CO(2) => \user_wr_addr0_carry__2_n_1\,
      CO(1) => \user_wr_addr0_carry__2_n_2\,
      CO(0) => \user_wr_addr0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_2_in(22 downto 19),
      S(3 downto 0) => \^user_wr_addr\(14 downto 11)
    );
\user_wr_addr0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \user_wr_addr0_carry__2_n_0\,
      CO(3) => \user_wr_addr0_carry__3_n_0\,
      CO(2) => \user_wr_addr0_carry__3_n_1\,
      CO(1) => \user_wr_addr0_carry__3_n_2\,
      CO(0) => \user_wr_addr0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_2_in(26 downto 23),
      S(3 downto 0) => \^user_wr_addr\(18 downto 15)
    );
\user_wr_addr0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \user_wr_addr0_carry__3_n_0\,
      CO(3) => \user_wr_addr0_carry__4_n_0\,
      CO(2) => \user_wr_addr0_carry__4_n_1\,
      CO(1) => \user_wr_addr0_carry__4_n_2\,
      CO(0) => \user_wr_addr0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => p_2_in(30 downto 27),
      S(3 downto 0) => \^user_wr_addr\(22 downto 19)
    );
\user_wr_addr0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \user_wr_addr0_carry__4_n_0\,
      CO(3 downto 0) => \NLW_user_wr_addr0_carry__5_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_user_wr_addr0_carry__5_O_UNCONNECTED\(3 downto 1),
      O(0) => p_2_in(31),
      S(3 downto 1) => B"000",
      S(0) => \^user_wr_addr\(23)
    );
user_wr_addr0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^user_wr_addr\(0),
      O => user_wr_addr0_carry_i_1_n_0
    );
\user_wr_addr[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FECE000000000000"
    )
        port map (
      I0 => \^user_wr_addr\(7),
      I1 => \^user_wr_addr_reg[30]_0\,
      I2 => \^user_wr_last_reg_0\,
      I3 => p_2_in(15),
      I4 => wr_rst_n_sync,
      I5 => \^write_task_busy_reg_0\,
      O => \user_wr_addr[15]_i_1_n_0\
    );
\user_wr_addr[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FECE000000000000"
    )
        port map (
      I0 => \^user_wr_addr\(10),
      I1 => \^user_wr_addr_reg[30]_0\,
      I2 => \^user_wr_last_reg_0\,
      I3 => p_2_in(18),
      I4 => wr_rst_n_sync,
      I5 => \^write_task_busy_reg_0\,
      O => \user_wr_addr[18]_i_1_n_0\
    );
\user_wr_addr[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FECE000000000000"
    )
        port map (
      I0 => \^user_wr_addr\(11),
      I1 => \^user_wr_addr_reg[30]_0\,
      I2 => \^user_wr_last_reg_0\,
      I3 => p_2_in(19),
      I4 => wr_rst_n_sync,
      I5 => \^write_task_busy_reg_0\,
      O => \user_wr_addr[19]_i_1_n_0\
    );
\user_wr_addr[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \^user_wr_addr_reg[30]_0\,
      I1 => wr_rst_n_sync,
      I2 => \^write_task_busy_reg_0\,
      O => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(10),
      Q => \^user_wr_addr\(2),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(11),
      Q => \^user_wr_addr\(3),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(12),
      Q => \^user_wr_addr\(4),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(13),
      Q => \^user_wr_addr\(5),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(14),
      Q => \^user_wr_addr\(6),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \user_wr_addr[15]_i_1_n_0\,
      Q => \^user_wr_addr\(7),
      R => '0'
    );
\user_wr_addr_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(16),
      Q => \^user_wr_addr\(8),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(17),
      Q => \^user_wr_addr\(9),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \user_wr_addr[18]_i_1_n_0\,
      Q => \^user_wr_addr\(10),
      R => '0'
    );
\user_wr_addr_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \user_wr_addr[19]_i_1_n_0\,
      Q => \^user_wr_addr\(11),
      R => '0'
    );
\user_wr_addr_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(20),
      Q => \^user_wr_addr\(12),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(21),
      Q => \^user_wr_addr\(13),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(22),
      Q => \^user_wr_addr\(14),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(23),
      Q => \^user_wr_addr\(15),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(24),
      Q => \^user_wr_addr\(16),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(25),
      Q => \^user_wr_addr\(17),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(26),
      Q => \^user_wr_addr\(18),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(27),
      Q => \^user_wr_addr\(19),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(28),
      Q => \^user_wr_addr\(20),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(29),
      Q => \^user_wr_addr\(21),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(30),
      Q => \^user_wr_addr\(22),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(31),
      Q => \^user_wr_addr\(23),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(8),
      Q => \^user_wr_addr\(0),
      R => \user_wr_addr[31]_i_1_n_0\
    );
\user_wr_addr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \^user_wr_last_reg_0\,
      D => p_2_in(9),
      Q => \^user_wr_addr\(1),
      R => \user_wr_addr[31]_i_1_n_0\
    );
user_wr_last_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000000"
    )
        port map (
      I0 => user_write_vld_i_4_n_0,
      I1 => user_wr_last_i_2_n_0,
      I2 => user_wr_last_i_3_n_0,
      I3 => user_wr_last_i_4_n_0,
      I4 => wr_rst_n_sync,
      I5 => \^write_task_busy_reg_0\,
      O => user_wr_last_i_1_n_0
    );
user_wr_last_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF2F2FFF2"
    )
        port map (
      I0 => wr_cnt_reg(12),
      I1 => wr_cnt_reg(13),
      I2 => wr_cnt_reg(14),
      I3 => wr_cnt_reg(15),
      I4 => wr_cnt_reg(16),
      I5 => wr_cnt_reg(17),
      O => user_wr_last_i_2_n_0
    );
user_wr_last_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFFFFFF"
    )
        port map (
      I0 => user_write_vld_i_7_n_0,
      I1 => wr_cnt_reg(2),
      I2 => wr_cnt_reg(1),
      I3 => wr_cnt_reg(0),
      I4 => wr_cnt_reg(3),
      O => user_wr_last_i_3_n_0
    );
user_wr_last_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000045"
    )
        port map (
      I0 => wr_cnt_reg(11),
      I1 => wr_cnt_reg(10),
      I2 => wr_cnt_reg(9),
      I3 => \wr_cnt[0]_i_5_n_0\,
      I4 => user_wr_last_i_5_n_0,
      O => user_wr_last_i_4_n_0
    );
user_wr_last_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => wr_cnt_reg(8),
      I1 => wr_cnt_reg(7),
      I2 => wr_cnt_reg(6),
      O => user_wr_last_i_5_n_0
    );
user_wr_last_reg: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => user_wr_last_i_1_n_0,
      Q => \^user_wr_last_reg_0\,
      R => '0'
    );
\user_wr_length[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => wr_rst_n_sync,
      I1 => \^write_task_busy_reg_0\,
      O => \user_wr_length[8]_i_1_n_0\
    );
\user_wr_length_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \user_wr_length[8]_i_1_n_0\,
      Q => user_wr_length(0),
      R => '0'
    );
user_write_vld_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000AAAE"
    )
        port map (
      I0 => \^user_write_vld\,
      I1 => user_write_vld_i_2_n_0,
      I2 => user_write_vld_i_3_n_0,
      I3 => user_write_vld_i_4_n_0,
      I4 => user_write_vld1,
      I5 => \^user_wr_addr_reg[30]_0\,
      O => user_write_vld_i_1_n_0
    );
user_write_vld_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000000D"
    )
        port map (
      I0 => wr_cnt_reg(6),
      I1 => wr_cnt_reg(7),
      I2 => wr_cnt_reg(8),
      I3 => user_write_vld_i_6_n_0,
      I4 => user_write_vld_i_7_n_0,
      O => user_write_vld_i_2_n_0
    );
user_write_vld_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => user_write_vld_i_8_n_0,
      I1 => wr_cnt_reg(1),
      I2 => wr_cnt_reg(5),
      I3 => wr_cnt_reg(3),
      I4 => wr_cnt_reg(0),
      I5 => user_write_vld_i_9_n_0,
      O => user_write_vld_i_3_n_0
    );
user_write_vld_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wr_cnt_reg(8),
      I1 => wr_cnt_reg(7),
      I2 => wr_cnt_reg(11),
      I3 => wr_cnt_reg(10),
      O => user_write_vld_i_4_n_0
    );
user_write_vld_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^write_task_busy_reg_0\,
      I1 => wr_rst_n_sync,
      O => user_write_vld1
    );
user_write_vld_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => wr_cnt_reg(14),
      I1 => wr_cnt_reg(13),
      I2 => wr_cnt_reg(12),
      O => user_write_vld_i_6_n_0
    );
user_write_vld_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wr_cnt_reg(19),
      I1 => wr_cnt_reg(18),
      I2 => wr_cnt_reg(17),
      I3 => wr_cnt_reg(16),
      O => user_write_vld_i_7_n_0
    );
user_write_vld_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFEFFFFFFFE"
    )
        port map (
      I0 => wr_cnt_reg(14),
      I1 => wr_cnt_reg(13),
      I2 => wr_cnt_reg(4),
      I3 => wr_cnt_reg(2),
      I4 => wr_cnt_reg(15),
      I5 => wr_cnt_reg(16),
      O => user_write_vld_i_8_n_0
    );
user_write_vld_i_9: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => wr_cnt_reg(11),
      I1 => wr_cnt_reg(10),
      I2 => wr_cnt_reg(9),
      O => user_write_vld_i_9_n_0
    );
user_write_vld_reg: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => user_write_vld_i_1_n_0,
      Q => \^user_write_vld\,
      R => '0'
    );
\wr_cnt[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"777777777777777F"
    )
        port map (
      I0 => wr_rst_n_sync,
      I1 => \^write_task_busy_reg_0\,
      I2 => user_wr_last_i_3_n_0,
      I3 => \wr_cnt[0]_i_3_n_0\,
      I4 => \wr_cnt[0]_i_4_n_0\,
      I5 => \wr_cnt[0]_i_5_n_0\,
      O => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => wr_cnt_reg(15),
      I1 => wr_cnt_reg(8),
      I2 => wr_cnt_reg(9),
      I3 => wr_cnt_reg(6),
      I4 => wr_cnt_reg(12),
      O => \wr_cnt[0]_i_3_n_0\
    );
\wr_cnt[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => wr_cnt_reg(10),
      I1 => wr_cnt_reg(11),
      I2 => wr_cnt_reg(7),
      O => \wr_cnt[0]_i_4_n_0\
    );
\wr_cnt[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => wr_cnt_reg(14),
      I1 => wr_cnt_reg(13),
      I2 => wr_cnt_reg(5),
      I3 => wr_cnt_reg(4),
      O => \wr_cnt[0]_i_5_n_0\
    );
\wr_cnt[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wr_cnt_reg(0),
      O => \wr_cnt[0]_i_6_n_0\
    );
\wr_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[0]_i_2_n_7\,
      Q => wr_cnt_reg(0),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wr_cnt_reg[0]_i_2_n_0\,
      CO(2) => \wr_cnt_reg[0]_i_2_n_1\,
      CO(1) => \wr_cnt_reg[0]_i_2_n_2\,
      CO(0) => \wr_cnt_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \wr_cnt_reg[0]_i_2_n_4\,
      O(2) => \wr_cnt_reg[0]_i_2_n_5\,
      O(1) => \wr_cnt_reg[0]_i_2_n_6\,
      O(0) => \wr_cnt_reg[0]_i_2_n_7\,
      S(3 downto 1) => wr_cnt_reg(3 downto 1),
      S(0) => \wr_cnt[0]_i_6_n_0\
    );
\wr_cnt_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[8]_i_1_n_5\,
      Q => wr_cnt_reg(10),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[8]_i_1_n_4\,
      Q => wr_cnt_reg(11),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[12]_i_1_n_7\,
      Q => wr_cnt_reg(12),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wr_cnt_reg[8]_i_1_n_0\,
      CO(3) => \wr_cnt_reg[12]_i_1_n_0\,
      CO(2) => \wr_cnt_reg[12]_i_1_n_1\,
      CO(1) => \wr_cnt_reg[12]_i_1_n_2\,
      CO(0) => \wr_cnt_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wr_cnt_reg[12]_i_1_n_4\,
      O(2) => \wr_cnt_reg[12]_i_1_n_5\,
      O(1) => \wr_cnt_reg[12]_i_1_n_6\,
      O(0) => \wr_cnt_reg[12]_i_1_n_7\,
      S(3 downto 0) => wr_cnt_reg(15 downto 12)
    );
\wr_cnt_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[12]_i_1_n_6\,
      Q => wr_cnt_reg(13),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[12]_i_1_n_5\,
      Q => wr_cnt_reg(14),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[12]_i_1_n_4\,
      Q => wr_cnt_reg(15),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[16]_i_1_n_7\,
      Q => wr_cnt_reg(16),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wr_cnt_reg[12]_i_1_n_0\,
      CO(3) => \NLW_wr_cnt_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \wr_cnt_reg[16]_i_1_n_1\,
      CO(1) => \wr_cnt_reg[16]_i_1_n_2\,
      CO(0) => \wr_cnt_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wr_cnt_reg[16]_i_1_n_4\,
      O(2) => \wr_cnt_reg[16]_i_1_n_5\,
      O(1) => \wr_cnt_reg[16]_i_1_n_6\,
      O(0) => \wr_cnt_reg[16]_i_1_n_7\,
      S(3 downto 0) => wr_cnt_reg(19 downto 16)
    );
\wr_cnt_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[16]_i_1_n_6\,
      Q => wr_cnt_reg(17),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[16]_i_1_n_5\,
      Q => wr_cnt_reg(18),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[16]_i_1_n_4\,
      Q => wr_cnt_reg(19),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[0]_i_2_n_6\,
      Q => wr_cnt_reg(1),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[0]_i_2_n_5\,
      Q => wr_cnt_reg(2),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[0]_i_2_n_4\,
      Q => wr_cnt_reg(3),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[4]_i_1_n_7\,
      Q => wr_cnt_reg(4),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wr_cnt_reg[0]_i_2_n_0\,
      CO(3) => \wr_cnt_reg[4]_i_1_n_0\,
      CO(2) => \wr_cnt_reg[4]_i_1_n_1\,
      CO(1) => \wr_cnt_reg[4]_i_1_n_2\,
      CO(0) => \wr_cnt_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wr_cnt_reg[4]_i_1_n_4\,
      O(2) => \wr_cnt_reg[4]_i_1_n_5\,
      O(1) => \wr_cnt_reg[4]_i_1_n_6\,
      O(0) => \wr_cnt_reg[4]_i_1_n_7\,
      S(3 downto 0) => wr_cnt_reg(7 downto 4)
    );
\wr_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[4]_i_1_n_6\,
      Q => wr_cnt_reg(5),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[4]_i_1_n_5\,
      Q => wr_cnt_reg(6),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[4]_i_1_n_4\,
      Q => wr_cnt_reg(7),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[8]_i_1_n_7\,
      Q => wr_cnt_reg(8),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_cnt_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wr_cnt_reg[4]_i_1_n_0\,
      CO(3) => \wr_cnt_reg[8]_i_1_n_0\,
      CO(2) => \wr_cnt_reg[8]_i_1_n_1\,
      CO(1) => \wr_cnt_reg[8]_i_1_n_2\,
      CO(0) => \wr_cnt_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \wr_cnt_reg[8]_i_1_n_4\,
      O(2) => \wr_cnt_reg[8]_i_1_n_5\,
      O(1) => \wr_cnt_reg[8]_i_1_n_6\,
      O(0) => \wr_cnt_reg[8]_i_1_n_7\,
      S(3 downto 0) => wr_cnt_reg(11 downto 8)
    );
\wr_cnt_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => \wr_cnt_reg[8]_i_1_n_6\,
      Q => wr_cnt_reg(9),
      R => \wr_cnt[0]_i_1_n_0\
    );
\wr_reset_timer[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wr_reset_timer_reg(0),
      O => p_0_in(0)
    );
\wr_reset_timer[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => wr_reset_timer_reg(0),
      I1 => wr_reset_timer_reg(1),
      O => p_0_in(1)
    );
\wr_reset_timer[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => wr_reset_timer_reg(2),
      I1 => wr_reset_timer_reg(1),
      I2 => wr_reset_timer_reg(0),
      O => \wr_reset_timer[2]_i_1_n_0\
    );
\wr_reset_timer[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => wr_reset_timer_reg(3),
      I1 => wr_reset_timer_reg(1),
      I2 => wr_reset_timer_reg(0),
      I3 => wr_reset_timer_reg(2),
      O => p_0_in(3)
    );
\wr_reset_timer[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => wr_reset_timer_reg(4),
      I1 => wr_reset_timer_reg(3),
      I2 => wr_reset_timer_reg(1),
      I3 => wr_reset_timer_reg(0),
      I4 => wr_reset_timer_reg(2),
      O => \wr_reset_timer[4]_i_1_n_0\
    );
\wr_reset_timer[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => wr_reset_timer_reg(5),
      I1 => wr_reset_timer_reg(2),
      I2 => wr_reset_timer_reg(0),
      I3 => wr_reset_timer_reg(1),
      I4 => wr_reset_timer_reg(3),
      I5 => wr_reset_timer_reg(4),
      O => p_0_in(5)
    );
\wr_reset_timer[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => wr_reset_timer_reg(6),
      I1 => \wr_reset_timer[9]_i_5_n_0\,
      O => p_0_in(6)
    );
\wr_reset_timer[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => wr_reset_timer_reg(7),
      I1 => \wr_reset_timer[9]_i_5_n_0\,
      I2 => wr_reset_timer_reg(6),
      O => p_0_in(7)
    );
\wr_reset_timer[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => wr_reset_timer_reg(8),
      I1 => wr_reset_timer_reg(6),
      I2 => \wr_reset_timer[9]_i_5_n_0\,
      I3 => wr_reset_timer_reg(7),
      O => p_0_in(8)
    );
\wr_reset_timer[9]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => \wr_reset_timer[9]_i_1_n_0\
    );
\wr_reset_timer[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00005557"
    )
        port map (
      I0 => wr_reset_timer_reg(3),
      I1 => wr_reset_timer_reg(0),
      I2 => wr_reset_timer_reg(1),
      I3 => wr_reset_timer_reg(2),
      I4 => wr_reset_timer_reg(4),
      I5 => \wr_reset_timer[9]_i_4_n_0\,
      O => \wr_reset_timer[9]_i_2_n_0\
    );
\wr_reset_timer[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => wr_reset_timer_reg(9),
      I1 => wr_reset_timer_reg(8),
      I2 => wr_reset_timer_reg(7),
      I3 => wr_reset_timer_reg(6),
      I4 => \wr_reset_timer[9]_i_5_n_0\,
      O => p_0_in(9)
    );
\wr_reset_timer[9]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => wr_reset_timer_reg(6),
      I1 => wr_reset_timer_reg(7),
      I2 => wr_reset_timer_reg(8),
      I3 => wr_reset_timer_reg(9),
      I4 => wr_reset_timer_reg(5),
      O => \wr_reset_timer[9]_i_4_n_0\
    );
\wr_reset_timer[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => wr_reset_timer_reg(5),
      I1 => wr_reset_timer_reg(2),
      I2 => wr_reset_timer_reg(0),
      I3 => wr_reset_timer_reg(1),
      I4 => wr_reset_timer_reg(3),
      I5 => wr_reset_timer_reg(4),
      O => \wr_reset_timer[9]_i_5_n_0\
    );
\wr_reset_timer_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \wr_reset_timer[9]_i_2_n_0\,
      D => p_0_in(0),
      Q => wr_reset_timer_reg(0),
      R => \wr_reset_timer[9]_i_1_n_0\
    );
\wr_reset_timer_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \wr_reset_timer[9]_i_2_n_0\,
      D => p_0_in(1),
      Q => wr_reset_timer_reg(1),
      R => \wr_reset_timer[9]_i_1_n_0\
    );
\wr_reset_timer_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \wr_reset_timer[9]_i_2_n_0\,
      D => \wr_reset_timer[2]_i_1_n_0\,
      Q => wr_reset_timer_reg(2),
      R => \wr_reset_timer[9]_i_1_n_0\
    );
\wr_reset_timer_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \wr_reset_timer[9]_i_2_n_0\,
      D => p_0_in(3),
      Q => wr_reset_timer_reg(3),
      R => \wr_reset_timer[9]_i_1_n_0\
    );
\wr_reset_timer_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \wr_reset_timer[9]_i_2_n_0\,
      D => \wr_reset_timer[4]_i_1_n_0\,
      Q => wr_reset_timer_reg(4),
      R => \wr_reset_timer[9]_i_1_n_0\
    );
\wr_reset_timer_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \wr_reset_timer[9]_i_2_n_0\,
      D => p_0_in(5),
      Q => wr_reset_timer_reg(5),
      R => \wr_reset_timer[9]_i_1_n_0\
    );
\wr_reset_timer_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \wr_reset_timer[9]_i_2_n_0\,
      D => p_0_in(6),
      Q => wr_reset_timer_reg(6),
      R => \wr_reset_timer[9]_i_1_n_0\
    );
\wr_reset_timer_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \wr_reset_timer[9]_i_2_n_0\,
      D => p_0_in(7),
      Q => wr_reset_timer_reg(7),
      R => \wr_reset_timer[9]_i_1_n_0\
    );
\wr_reset_timer_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \wr_reset_timer[9]_i_2_n_0\,
      D => p_0_in(8),
      Q => wr_reset_timer_reg(8),
      R => \wr_reset_timer[9]_i_1_n_0\
    );
\wr_reset_timer_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => \wr_reset_timer[9]_i_2_n_0\,
      D => p_0_in(9),
      Q => wr_reset_timer_reg(9),
      R => \wr_reset_timer[9]_i_1_n_0\
    );
wr_rst_n_sync_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => rst_n,
      I1 => \wr_reset_timer[9]_i_2_n_0\,
      O => wr_rst_n_sync_i_1_n_0
    );
wr_rst_n_sync_reg: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => wr_rst_n_sync_i_1_n_0,
      Q => wr_rst_n_sync,
      R => '0'
    );
write_done_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => write_done_INST_0_i_1_n_0,
      I1 => write_done_INST_0_i_2_n_0,
      I2 => write_done_INST_0_i_3_n_0,
      I3 => write_done_INST_0_i_4_n_0,
      I4 => write_done_INST_0_i_5_n_0,
      I5 => write_done_INST_0_i_6_n_0,
      O => \^user_wr_addr_reg[30]_0\
    );
write_done_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^user_wr_addr\(22),
      I1 => \^user_wr_addr\(18),
      I2 => \^user_wr_addr\(9),
      I3 => \^user_wr_addr\(3),
      O => write_done_INST_0_i_1_n_0
    );
write_done_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => \^user_wr_addr\(23),
      I1 => \^user_wr_addr\(15),
      I2 => \^user_wr_addr\(11),
      I3 => \^user_wr_addr\(17),
      O => write_done_INST_0_i_2_n_0
    );
write_done_INST_0_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^user_wr_last_reg_0\,
      I1 => \^user_wr_addr\(10),
      I2 => \^user_wr_addr\(1),
      O => write_done_INST_0_i_3_n_0
    );
write_done_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^user_wr_addr\(6),
      I1 => \^user_wr_addr\(21),
      I2 => \^user_wr_addr\(20),
      I3 => \^user_wr_addr\(14),
      O => write_done_INST_0_i_4_n_0
    );
write_done_INST_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^user_wr_addr\(5),
      I1 => \^user_wr_addr\(4),
      I2 => \^user_wr_addr\(13),
      I3 => \^user_wr_addr\(0),
      O => write_done_INST_0_i_5_n_0
    );
write_done_INST_0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFFFFF"
    )
        port map (
      I0 => \^user_wr_addr\(19),
      I1 => \^user_wr_addr\(2),
      I2 => \^user_wr_addr\(12),
      I3 => \^user_wr_addr\(16),
      I4 => \^user_wr_addr\(8),
      I5 => \^user_wr_addr\(7),
      O => write_done_INST_0_i_6_n_0
    );
write_signal_d0_reg: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => write_signal,
      Q => write_signal_d0,
      R => '0'
    );
write_task_busy_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22F20000"
    )
        port map (
      I0 => \^write_task_busy_reg_0\,
      I1 => \^user_wr_addr_reg[30]_0\,
      I2 => write_signal,
      I3 => write_signal_d0,
      I4 => wr_rst_n_sync,
      O => write_task_busy_i_1_n_0
    );
write_task_busy_reg: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => write_task_busy_i_1_n_0,
      Q => \^write_task_busy_reg_0\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_data_trans_ctrl_0_0 is
  port (
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    write_signal : in STD_LOGIC;
    read_signal : in STD_LOGIC;
    write_done : out STD_LOGIC;
    read_done : out STD_LOGIC;
    write_task_busy : out STD_LOGIC;
    read_task_busy : out STD_LOGIC;
    write_data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    read_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    axi_clk : in STD_LOGIC;
    user_write_vld : out STD_LOGIC;
    user_wr_last : out STD_LOGIC;
    user_wr_length : out STD_LOGIC_VECTOR ( 12 downto 0 );
    user_wr_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    user_wr_data : out STD_LOGIC_VECTOR ( 15 downto 0 );
    user_read_vld : out STD_LOGIC;
    user_rd_last : in STD_LOGIC;
    user_rd_length : out STD_LOGIC_VECTOR ( 12 downto 0 );
    user_rd_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    user_rd_data : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_data_trans_ctrl_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_data_trans_ctrl_0_0 : entity is "system_data_trans_ctrl_0_0,data_trans_ctrl,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_data_trans_ctrl_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of system_data_trans_ctrl_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_data_trans_ctrl_0_0 : entity is "data_trans_ctrl,Vivado 2023.1";
end system_data_trans_ctrl_0_0;

architecture STRUCTURE of system_data_trans_ctrl_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^user_rd_addr\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \^user_rd_data\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \^user_rd_length\ : STD_LOGIC_VECTOR ( 8 to 8 );
  signal \^user_wr_addr\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \^user_wr_length\ : STD_LOGIC_VECTOR ( 8 to 8 );
  signal \^write_data\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of axi_clk : signal is "xilinx.com:signal:clock:1.0 axi_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of axi_clk : signal is "XIL_INTERFACENAME axi_clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rd_clk : signal is "xilinx.com:signal:clock:1.0 rd_clk CLK";
  attribute X_INTERFACE_PARAMETER of rd_clk : signal is "XIL_INTERFACENAME rd_clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of wr_clk : signal is "xilinx.com:signal:clock:1.0 wr_clk CLK";
  attribute X_INTERFACE_PARAMETER of wr_clk : signal is "XIL_INTERFACENAME wr_clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
begin
  \^user_rd_data\(15 downto 0) <= user_rd_data(15 downto 0);
  \^write_data\(15 downto 0) <= write_data(15 downto 0);
  read_data(15 downto 0) <= \^user_rd_data\(15 downto 0);
  user_rd_addr(31 downto 8) <= \^user_rd_addr\(31 downto 8);
  user_rd_addr(7) <= \<const0>\;
  user_rd_addr(6) <= \<const0>\;
  user_rd_addr(5) <= \<const0>\;
  user_rd_addr(4) <= \<const0>\;
  user_rd_addr(3) <= \<const0>\;
  user_rd_addr(2) <= \<const0>\;
  user_rd_addr(1) <= \<const0>\;
  user_rd_addr(0) <= \<const0>\;
  user_rd_length(12) <= \<const0>\;
  user_rd_length(11) <= \<const0>\;
  user_rd_length(10) <= \<const0>\;
  user_rd_length(9) <= \<const0>\;
  user_rd_length(8) <= \^user_rd_length\(8);
  user_rd_length(7) <= \<const0>\;
  user_rd_length(6) <= \<const0>\;
  user_rd_length(5) <= \<const0>\;
  user_rd_length(4) <= \<const0>\;
  user_rd_length(3) <= \<const0>\;
  user_rd_length(2) <= \<const0>\;
  user_rd_length(1) <= \<const0>\;
  user_rd_length(0) <= \<const0>\;
  user_wr_addr(31 downto 8) <= \^user_wr_addr\(31 downto 8);
  user_wr_addr(7) <= \<const0>\;
  user_wr_addr(6) <= \<const0>\;
  user_wr_addr(5) <= \<const0>\;
  user_wr_addr(4) <= \<const0>\;
  user_wr_addr(3) <= \<const0>\;
  user_wr_addr(2) <= \<const0>\;
  user_wr_addr(1) <= \<const0>\;
  user_wr_addr(0) <= \<const0>\;
  user_wr_data(15 downto 0) <= \^write_data\(15 downto 0);
  user_wr_length(12) <= \<const0>\;
  user_wr_length(11) <= \<const0>\;
  user_wr_length(10) <= \<const0>\;
  user_wr_length(9) <= \<const0>\;
  user_wr_length(8) <= \^user_wr_length\(8);
  user_wr_length(7) <= \<const0>\;
  user_wr_length(6) <= \<const0>\;
  user_wr_length(5) <= \<const0>\;
  user_wr_length(4) <= \<const0>\;
  user_wr_length(3) <= \<const0>\;
  user_wr_length(2) <= \<const0>\;
  user_wr_length(1) <= \<const0>\;
  user_wr_length(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst: entity work.system_data_trans_ctrl_0_0_data_trans_ctrl
     port map (
      rd_clk => rd_clk,
      read_signal => read_signal,
      read_task_busy_reg_0 => read_task_busy,
      rst_n => rst_n,
      user_rd_addr(23 downto 0) => \^user_rd_addr\(31 downto 8),
      \user_rd_addr_reg[30]_0\ => read_done,
      user_rd_last => user_rd_last,
      user_rd_length(0) => \^user_rd_length\(8),
      user_read_vld => user_read_vld,
      user_wr_addr(23 downto 0) => \^user_wr_addr\(31 downto 8),
      \user_wr_addr_reg[30]_0\ => write_done,
      user_wr_last_reg_0 => user_wr_last,
      user_wr_length(0) => \^user_wr_length\(8),
      user_write_vld => user_write_vld,
      wr_clk => wr_clk,
      write_signal => write_signal,
      write_task_busy_reg_0 => write_task_busy
    );
end STRUCTURE;

// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sat Jun 21 15:05:08 2025
// Host        : DESKTOP-K54KI5V running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/tzh/Desktop/PLL_ADC_Capture-2-ETH/3_AXI_Full_2_DDR_ETH_20250318_tzh_board/soc.gen/sources_1/bd/system/ip/system_dds_compiler_0_0/system_dds_compiler_0_0_sim_netlist.v
// Design      : system_dds_compiler_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z015clg485-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_dds_compiler_0_0,dds_compiler_v6_0_22,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0_22,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module system_dds_compiler_0_0
   (aclk,
    m_axis_data_tvalid,
    m_axis_data_tdata);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF M_AXIS_PHASE:S_AXIS_CONFIG:M_AXIS_DATA:S_AXIS_PHASE, ASSOCIATED_RESET aresetn, ASSOCIATED_CLKEN aclken, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input aclk;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_DATA, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 200000000, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chan} size {attribs {resolve_type generated dependency chan_size format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency chan_stride format long minimum {} maximum {}} value 16} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_cosine {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value cosine} enabled {attribs {resolve_type generated dependency cosine_enabled format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency cosine_width format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type generated dependency cosine_fractwidth format long minimum {} maximum {}} value 7} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}} field_sine {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value sine} enabled {attribs {resolve_type generated dependency sine_enabled format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency sine_width format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type generated dependency sine_offset format long minimum {} maximum {}} value 8} real {fixed {fractwidth {attribs {resolve_type generated dependency sine_fractwidth format long minimum {} maximum {}} value 7} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}}}}} TDATA_WIDTH 16 TUSER {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_chanid {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value chanid} enabled {attribs {resolve_type generated dependency chanid_enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency chanid_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} field_user {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value user} enabled {attribs {resolve_type generated dependency user_enabled format bool minimum {} maximum {}} value false} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency user_width format long minimum {} maximum {}} value 0} bitoffset {attribs {resolve_type generated dependency user_offset format long minimum {} maximum {}} value 0}}}}}} TUSER_WIDTH 0}, INSERT_VIP 0" *) output m_axis_data_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TDATA" *) output [15:0]m_axis_data_tdata;

  wire aclk;
  wire [15:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire NLW_U0_debug_axi_resync_in_UNCONNECTED;
  wire NLW_U0_debug_core_nd_UNCONNECTED;
  wire NLW_U0_debug_phase_nd_UNCONNECTED;
  wire NLW_U0_event_phase_in_invalid_UNCONNECTED;
  wire NLW_U0_event_pinc_invalid_UNCONNECTED;
  wire NLW_U0_event_poff_invalid_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_m_axis_data_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tvalid_UNCONNECTED;
  wire NLW_U0_s_axis_config_tready_UNCONNECTED;
  wire NLW_U0_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_U0_debug_axi_chan_in_UNCONNECTED;
  wire [28:0]NLW_U0_debug_axi_pinc_in_UNCONNECTED;
  wire [28:0]NLW_U0_debug_axi_poff_in_UNCONNECTED;
  wire [28:0]NLW_U0_debug_phase_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tuser_UNCONNECTED;

  (* C_ACCUMULATOR_WIDTH = "29" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "1" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "0" *) 
  (* C_HAS_PHASEGEN = "1" *) 
  (* C_HAS_PHASE_OUT = "0" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "0" *) 
  (* C_HAS_S_PHASE = "0" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "16" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "2" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "8" *) 
  (* C_PHASE_ANGLE_WIDTH = "8" *) 
  (* C_PHASE_INCREMENT = "2" *) 
  (* C_PHASE_INCREMENT_VALUE = "1100110011001100110011001,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  system_dds_compiler_0_0_dds_compiler_v6_0_22 U0
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(1'b1),
        .debug_axi_chan_in(NLW_U0_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_U0_debug_axi_pinc_in_UNCONNECTED[28:0]),
        .debug_axi_poff_in(NLW_U0_debug_axi_poff_in_UNCONNECTED[28:0]),
        .debug_axi_resync_in(NLW_U0_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_U0_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_U0_debug_phase_UNCONNECTED[28:0]),
        .debug_phase_nd(NLW_U0_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_U0_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_U0_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_U0_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_U0_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_U0_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(NLW_U0_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_U0_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(NLW_U0_m_axis_phase_tdata_UNCONNECTED[0]),
        .m_axis_phase_tlast(NLW_U0_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_U0_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(NLW_U0_m_axis_phase_tvalid_UNCONNECTED),
        .s_axis_config_tdata(1'b0),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_U0_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(1'b0),
        .s_axis_phase_tdata(1'b0),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_U0_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
QAFh5C9VXVkSe/qIraO9mChLOxZ/WqWfof18iJd06zvvAfu7oC1TLbChkY41FyCMF89f2MggT0zZ
XzO4KWH6JNtkhEx9CFK5TxXov34SVXeNN2XP/ooZLSXPjx+1oUp0b5F8Tx4jPkWrhZ2/baiLhczm
eVYKE6ril8/FkXgMUz8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nuZpMOflCpu+EmQxZWbULOf7JzsPkCLDWbGpBd7ANdz9ShkKtTDVi0SRNm7ePgBqUlDqGHnQCZJh
vQg5wfvX9ccUQKBYSSc57ChyzU7ydUzaT0ER09OLepvW7z/oE/J/raA33cACHBTmlWd3YOwAdQEL
W9uQs81MX9Lc095uHEGR5je9S36q2trbyyyl4ZCv6/7OapHD3JTHFFC/u0s8i/NPk6nCjMlI3aYV
6F3+SY1yWSkKuiDh2zLcHqFSCWPZ27GYmS1q/bCzqsyOxy7vj3EGNrWCzkF5ssodp89qqHn+wTrK
eQIfoHWxhAHEgxSbCGkP4032+gg0CG2ccXrTgA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
AtieNO6aUHIX/3iLcWTl1w86vDBOb39SxXq5G2k9nDNTia/tkttN/z12G6Ere0RvAgf5v/kJY8FZ
Uh5Wr1gT/fbRs+cLdIZyI5XuwmTNMFoO0MvEfKgVNxtEujr/HzGR2KNFmYvKwLN3ciFSWuJq7A5T
MOkGVgJnlj10FtGVkU4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g2AJz6YcKkhnjDppBLTqIZ/1F5x+Yr4ITTAcL8i07fMw6/l+t/0vQ4PcqAqaGJwQgc2MtDlE4j9v
xOE4Tolf2MO1D7ZTycEVUiaHQ9H+Wr5pvNI3wcdVKobRmNZOZ9JU76SCCvM4o0OoQz8YRY2d6zcZ
5iC2KdxMB/1W+hwv+6M63lojuRrSrDeKTaNCRTjtsnr9UzGwRdjuxZVOCkv9Qq+uUn8zOrHevZTE
HcbED/Xeii5/sL4dEQyb9oxTHW76flG65p0iGkmik8JBV39SMgIZ46fWHXaxDx1jIReI3g/p3jbZ
JVgC0fGatPCVUrD4Ec4gSO3UEl6cNoLDmAtbCg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YqPATy8Zz9YiCAQho6xk3tcysgr5L6g2GU8V9qThv90PMOBjqR4HBMCPUvlWw+SygY5ZjouNfO16
OX2dw0KHKYFrIcei8+u0iBlE15eyxNUWLQXRIu2o/cVPhbt9Bl8HU/5SG2qmM4aj4HoH6MMzRYys
aKeQxmMfOUQiBwFMQq4ijLZ45Vh8Y//xtTYgy4XGK/DGuptPomnil3Qw7dXGE9DYmLznRj3ev4Yd
y/ZWVDBkpVS9oSUFjbHe7OE9nsKZu7uMRpaaWVMEhFSj4iLHGmIOK5NepfaAacd1fwunEhfMw2K7
E9YZJJFZPL+iH6VXjPhedI2/Qvr3ZjP6I5w3yw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
isyK9b7HLcAWPTIHUTOizgLPCBbbV5ZArY8oBZuAr0eDPRl+PNs8DyDronOYL7bTwyJsiW0ot+8h
i6Umo6mbsoLmUvBzN5BlfMtia17QhosjIRCO4e6W45OzyGUTltpf9M6wL9i5rzPw7oq/j8hNEkFh
dIzsGQERiyAD8nV0Bd1yRkwyTyKMbqEQBoIntBpf+pVP+TThX9/8U1dn14+ItuqgUEitb78ws9+8
hrOTFfN41QKnalTCnm3k+CiLqQFz2swdTmg04ltk9u/IbhokyvvwidrQW35ILcALcaGAnXiflxgD
X3oQzIVmUKt5ehOKSpLK+06ozeDxMJSvkM5dlA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mVetrYYQK8XFCuyYS9DCVsSl3PlBe19XCYtTOdy9pMQVnm2/PXGA7u4NHU24Lwxt8m/Yo2XwZizc
xaRzQd0N3p6eNjiTVS0nozpvw1NBfVOna+9lJqFLAjEzT+8DdysaCHT+8iPp4GcDHal155gbsIHT
IVdtVzdRbUHUP9PqGoaiOKepgW4F3xwD7z+aLtKN8Sz/asMibJnra6rSS+0HyFNeOQbETj8D/wl2
I6kEcrA074p7gXkUUGaFN1cIV1GdfYq8LeXETWZyXvSOumKDrmT5rjiRMJ4rKcW9FKTDj/wPU1RF
DN3MLSr2BaxorfgmNtBmTdCcf/gQWYCuKWjL1A==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
eVbGfSF8F0d8wQQO9uzQzqPZdqxy76oFY3uyivf5BaJwyKjvDOX/gtBJ0gTW1UsX5SPdEmDARP4Q
FFdwUEIZoI7g/JEfqo93H8dbBuJC8lHevnI8hK8sQTfUcCQqwvfGK93wZ/lvQLgQPGSRM14HRtdt
Q65aJ6Q3+23VyaZXSrCd6VJtz22odekGKO33c0MHec42oH6Muk74c1K8C/bg+dw9NGeOUsyt4Lbx
6nh8NLjll7f/ybmN6PRFuLDm0ranjrhTTV23y08rDvHs1dE5v55egCh+/0AB+XKKQTf+OLkHgOjl
G8ZjbIjHAx39FMM2UUmJ30Mwkgb1EDnwyTRmtjadjD5Lr1pAppeMcuk0eL/XS3r2R5URmY75pgfH
o58WIIQtvZYjVVRladq12v3etuzqrLuEpoBJxgH8KN2qgNSLZSq+oqEWNOJQDc0kUfQCIDapSKqh
RNK8j0OjMtqlHAxI1SnvQxsAPNjvhECs8dy1A6gNXJQ84XYd6NsA8vZ0

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jRnbW2CASIztmPMSjY9ilENfxgDe0IG9xDtvy1hJCP0ytSWv/cNsb/3ncwBa3qdEJ9YpnNOU91XS
UWShlDk47XNj83NkCithdmnpZET7KhZngOO/1HqLc2UpSnqu9GEFi5feSyMJeapAOCJTs14ofos0
fRq3u4fk2+cIplNN9J6byv5p15Ps9t8GbTo9DVOpCnJhEEtr12UYYPkQL+EFTLBEikMq7cCva3hU
b75rGl7OpPP+8gEYYJ2X7vClcMmgp7Tx4secgekATSE6i7A3ifJ60baBDnABV9GO2QNHUcYpULMb
FYr5R2ejHRHlUT1h2iDsOT6+MEqSjG8s5SBO+Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QVdegdBA+ruKIiAI3eZMKHfiSf7/MPBbXWu63qsSLB8/wZ+XvC8I5X5zsqUGL8V+EnWCNYwKw/R2
+Ic5jT68C16DQ4Q5DUViONqJPMKg9cE/hsBhP985louhU/yZqONzC2F8EquojitV7ziZDG10JjgM
XPZYCBxrYcFnFF2MdhRUTncyYwmO1pu5MhiEuDNNmpGZp2bikpGwcadFkRBYWqlBucA4l5RIedSW
gDh9APKPJ3YdkycQqdjQuntvmLG2MOKcAZW3rmj3x45Y5FaOsaYEAWp551x+XCwVWszHZM1jOlCs
EM8qomYgFSugmMsN+91hlWhz0bwfHW+Gk4RDAw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
V8LlvsLs0KheNHf4zWscU7O8lVzolGRUuKV5R8Bu16mqw4iLOASICjcGjjAm0VaU+F7+xwQwzLYU
d+A2lFV93EC6d5Gk/wRiVsz0jshGjgyPboQUN1SoCssbJLAGTaQerfWy4Aw37KQS2xI+h5Cletxv
2TOWrZdnFnB9pHn/HKF1JmFqp3w8r3DZxyelxBVIZSaVVqFILfscZDGOyGt05EB8Qp96IwzWQNDo
1F1Y2tnLQ7T98zOrJ++KC8Xv3FbFCkyqxdMNbZ/u/opllgHf2sxCD3FKM4H9f3UBBaC2uOqOFeoo
enPj4geejs85gN4xKCe/6mOmo27oDUkI4ft3dQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 49408)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

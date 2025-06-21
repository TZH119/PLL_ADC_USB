# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RD_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SINGLE_RD_LENGTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SINGLE_WR_LENGTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TOTAL_RD_LENGTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TOTAL_WR_LENGTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "USER_RD_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "USER_WR_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WR_BASEADDR" -parent ${Page_0}


}

proc update_PARAM_VALUE.AXI_ADDR_WIDTH { PARAM_VALUE.AXI_ADDR_WIDTH } {
	# Procedure called to update AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ADDR_WIDTH { PARAM_VALUE.AXI_ADDR_WIDTH } {
	# Procedure called to validate AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.RD_BASEADDR { PARAM_VALUE.RD_BASEADDR } {
	# Procedure called to update RD_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RD_BASEADDR { PARAM_VALUE.RD_BASEADDR } {
	# Procedure called to validate RD_BASEADDR
	return true
}

proc update_PARAM_VALUE.SINGLE_RD_LENGTH { PARAM_VALUE.SINGLE_RD_LENGTH } {
	# Procedure called to update SINGLE_RD_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SINGLE_RD_LENGTH { PARAM_VALUE.SINGLE_RD_LENGTH } {
	# Procedure called to validate SINGLE_RD_LENGTH
	return true
}

proc update_PARAM_VALUE.SINGLE_WR_LENGTH { PARAM_VALUE.SINGLE_WR_LENGTH } {
	# Procedure called to update SINGLE_WR_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SINGLE_WR_LENGTH { PARAM_VALUE.SINGLE_WR_LENGTH } {
	# Procedure called to validate SINGLE_WR_LENGTH
	return true
}

proc update_PARAM_VALUE.TOTAL_RD_LENGTH { PARAM_VALUE.TOTAL_RD_LENGTH } {
	# Procedure called to update TOTAL_RD_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TOTAL_RD_LENGTH { PARAM_VALUE.TOTAL_RD_LENGTH } {
	# Procedure called to validate TOTAL_RD_LENGTH
	return true
}

proc update_PARAM_VALUE.TOTAL_WR_LENGTH { PARAM_VALUE.TOTAL_WR_LENGTH } {
	# Procedure called to update TOTAL_WR_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TOTAL_WR_LENGTH { PARAM_VALUE.TOTAL_WR_LENGTH } {
	# Procedure called to validate TOTAL_WR_LENGTH
	return true
}

proc update_PARAM_VALUE.USER_RD_DATA_WIDTH { PARAM_VALUE.USER_RD_DATA_WIDTH } {
	# Procedure called to update USER_RD_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USER_RD_DATA_WIDTH { PARAM_VALUE.USER_RD_DATA_WIDTH } {
	# Procedure called to validate USER_RD_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.USER_WR_DATA_WIDTH { PARAM_VALUE.USER_WR_DATA_WIDTH } {
	# Procedure called to update USER_WR_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USER_WR_DATA_WIDTH { PARAM_VALUE.USER_WR_DATA_WIDTH } {
	# Procedure called to validate USER_WR_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.WR_BASEADDR { PARAM_VALUE.WR_BASEADDR } {
	# Procedure called to update WR_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WR_BASEADDR { PARAM_VALUE.WR_BASEADDR } {
	# Procedure called to validate WR_BASEADDR
	return true
}


proc update_MODELPARAM_VALUE.USER_WR_DATA_WIDTH { MODELPARAM_VALUE.USER_WR_DATA_WIDTH PARAM_VALUE.USER_WR_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USER_WR_DATA_WIDTH}] ${MODELPARAM_VALUE.USER_WR_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.USER_RD_DATA_WIDTH { MODELPARAM_VALUE.USER_RD_DATA_WIDTH PARAM_VALUE.USER_RD_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USER_RD_DATA_WIDTH}] ${MODELPARAM_VALUE.USER_RD_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.AXI_ADDR_WIDTH { MODELPARAM_VALUE.AXI_ADDR_WIDTH PARAM_VALUE.AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.WR_BASEADDR { MODELPARAM_VALUE.WR_BASEADDR PARAM_VALUE.WR_BASEADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WR_BASEADDR}] ${MODELPARAM_VALUE.WR_BASEADDR}
}

proc update_MODELPARAM_VALUE.RD_BASEADDR { MODELPARAM_VALUE.RD_BASEADDR PARAM_VALUE.RD_BASEADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RD_BASEADDR}] ${MODELPARAM_VALUE.RD_BASEADDR}
}

proc update_MODELPARAM_VALUE.SINGLE_WR_LENGTH { MODELPARAM_VALUE.SINGLE_WR_LENGTH PARAM_VALUE.SINGLE_WR_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SINGLE_WR_LENGTH}] ${MODELPARAM_VALUE.SINGLE_WR_LENGTH}
}

proc update_MODELPARAM_VALUE.SINGLE_RD_LENGTH { MODELPARAM_VALUE.SINGLE_RD_LENGTH PARAM_VALUE.SINGLE_RD_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SINGLE_RD_LENGTH}] ${MODELPARAM_VALUE.SINGLE_RD_LENGTH}
}

proc update_MODELPARAM_VALUE.TOTAL_WR_LENGTH { MODELPARAM_VALUE.TOTAL_WR_LENGTH PARAM_VALUE.TOTAL_WR_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TOTAL_WR_LENGTH}] ${MODELPARAM_VALUE.TOTAL_WR_LENGTH}
}

proc update_MODELPARAM_VALUE.TOTAL_RD_LENGTH { MODELPARAM_VALUE.TOTAL_RD_LENGTH PARAM_VALUE.TOTAL_RD_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TOTAL_RD_LENGTH}] ${MODELPARAM_VALUE.TOTAL_RD_LENGTH}
}


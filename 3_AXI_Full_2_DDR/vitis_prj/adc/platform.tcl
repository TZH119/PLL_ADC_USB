# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\tzh\Desktop\PLL_ADC_Capture-2-ETH\3_AXI_Full_2_DDR\vitis_prj\adc\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\tzh\Desktop\PLL_ADC_Capture-2-ETH\3_AXI_Full_2_DDR\vitis_prj\adc\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {adc}\
-hw {C:\Users\tzh\Desktop\PLL_ADC_Capture-2-ETH\3_AXI_Full_2_DDR\adc_capture_top.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {C:/Users/tzh/Desktop/PLL_ADC_Capture-2-ETH/3_AXI_Full_2_DDR/vitis_prj}

platform write
platform generate -domains 
platform active {adc}
platform generate
platform config -updatehw {C:/Users/tzh/Desktop/PLL_ADC_Capture-2-ETH/3_AXI_Full_2_DDR/adc_capture_top.xsa}
platform generate -domains 

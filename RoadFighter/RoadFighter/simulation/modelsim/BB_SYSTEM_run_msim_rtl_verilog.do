transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/shift_reg_start_done.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/max7219_ctrl.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/SC_DEBOUNCE1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/BB_SYSTEM.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/SC_MAIN_STATEMACHINE.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/SC_LEVELCOUNTER.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/SC_LEVEL_STATEMACHINE.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/SC_upSPEEDCOUNTER.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/CC_SPEEDCOMPARATOR.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/CC_MUX3_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/SC_PLAYER_STATEMACHINE.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/CC_DELAY.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/CC_JUDGE.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/CC_PLAYER_COMPARATOR.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/SC_RegSHIFTER_P1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/SC_RegSHIFTER_P2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/CC_LEVELMANAGER.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/CC_LEVELMANAGER_P2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/SC_RegGENERAL.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/SC_POINTCOUNTER.v}
vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/rtl/SC_LEVELPROGRESS.v}

vlog -vlog01compat -work work +incdir+C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/simulation/modelsim {C:/Users/Sab/Documents/Uniandes/Sem4/SED/RoadFighter/RoadFighter/simulation/modelsim/TB_SYSTEM.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  TB_SYSTEM

add wave *
view structure
view signals
run -all

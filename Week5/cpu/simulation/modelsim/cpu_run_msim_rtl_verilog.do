transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/SoC/Week5/cpu {E:/SoC/Week5/cpu/regfile.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week5/cpu {E:/SoC/Week5/cpu/pc.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week5/cpu {E:/SoC/Week5/cpu/mux2.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week5/cpu {E:/SoC/Week5/cpu/flag.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week5/cpu {E:/SoC/Week5/cpu/dmem.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week5/cpu {E:/SoC/Week5/cpu/decoder.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week5/cpu {E:/SoC/Week5/cpu/cpu.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week5/cpu {E:/SoC/Week5/cpu/control.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week5/cpu {E:/SoC/Week5/cpu/cmem.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week5/cpu {E:/SoC/Week5/cpu/alu.v}

vlog -vlog01compat -work work +incdir+E:/SoC/Week5/cpu {E:/SoC/Week5/cpu/tb_cpu.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_cpu

add wave *
view structure
view signals
run -all

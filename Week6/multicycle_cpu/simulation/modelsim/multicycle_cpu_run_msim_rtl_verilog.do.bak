transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/SoC/Week6/multicycle_cpu {E:/SoC/Week6/multicycle_cpu/register.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week6/multicycle_cpu {E:/SoC/Week6/multicycle_cpu/regfile.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week6/multicycle_cpu {E:/SoC/Week6/multicycle_cpu/pc.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week6/multicycle_cpu {E:/SoC/Week6/multicycle_cpu/mux2.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week6/multicycle_cpu {E:/SoC/Week6/multicycle_cpu/multicycle_cpu.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week6/multicycle_cpu {E:/SoC/Week6/multicycle_cpu/flag.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week6/multicycle_cpu {E:/SoC/Week6/multicycle_cpu/dmem.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week6/multicycle_cpu {E:/SoC/Week6/multicycle_cpu/decoder.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week6/multicycle_cpu {E:/SoC/Week6/multicycle_cpu/control.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week6/multicycle_cpu {E:/SoC/Week6/multicycle_cpu/cmem.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week6/multicycle_cpu {E:/SoC/Week6/multicycle_cpu/alu.v}

vlog -vlog01compat -work work +incdir+E:/SoC/Week6/multicycle_cpu {E:/SoC/Week6/multicycle_cpu/tb_multicycle_cpu.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_multicycle_cpu

add wave *
view structure
view signals
run -all

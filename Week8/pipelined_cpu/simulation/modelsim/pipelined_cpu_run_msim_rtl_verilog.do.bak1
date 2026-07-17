transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/register.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/regfile.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/pipelined_cpu.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/pc.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/mux4.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/mux2.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/hazard.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/flag.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/dmem.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/decoder.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/control.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/cmem.v}
vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/alu.v}

vlog -vlog01compat -work work +incdir+E:/SoC/Week8/pipelined_cpu {E:/SoC/Week8/pipelined_cpu/tb_pipelined_cpu.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_pipelined_cpu

add wave *
view structure
view signals
run -all

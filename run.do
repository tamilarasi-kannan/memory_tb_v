vlib work
vlog memory_tb.v
vsim top
add wave -position insertpoint sim:/top/dut/*
#do wave.do
run -all


SIM ?= icarus
MODULE = SystolicArray
TOPLEVEL = Systolic_array
VERILOG_SOURCES = $(PWD)/systolic_array.v
include $(shell cocotb-config --makefiles)/Makefile.sim
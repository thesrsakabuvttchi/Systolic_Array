SIM ?= icarus
MODULE = MAC
TOPLEVEL = Punit
VERILOG_SOURCES = $(PWD)/Punit.v
include $(shell cocotb-config --makefiles)/Makefile.sim
# TODO: Change to your Vivado IDE version and installed location
VIVADO_VERSION ?= 2017.2
VIVADO_TOOL_BASE ?= /opt/Xilinx_$(VIVADO_VERSION)

# Vivado and SDK tool executable binary location
VIVADO_TOOL_PATH := $(VIVADO_TOOL_BASE)/Vivado/$(VIVADO_VERSION)/bin
SDK_TOOL_PATH := $(VIVADO_TOOL_BASE)/SDK/$(VIVADO_VERSION)/bin

# Leveraged Vivado tools
VIVADO_BIN := $(VIVADO_TOOL_PATH)/vivado
BOOT_GEN_BIN := $(SDK_TOOL_PATH)/bootgen

# Temporal directory to hold hardware design output files 
# (i.e., bitstream, hardware definition file (HDF))
HW_PLATFORM := $(shell pwd)/hw_plat
BITSTREAM := $(HW_PLATFORM)/system.bit
HW_DESIGN_HDF := $(HW_PLATFORM)/system.hdf

# HW_ACT list
#==========================================
# prj_gen: 		Creating Vivado project and generating hardware 
# 				definiation file (HDF)
# rtl_chk: 		Checking RTL syntax and synthesizability in this project
# sch_gen:		Generating gate-level schematic of a RTL module
# bhv_sim:		Launching behavioral simulation and 
# 				dumping the waveform file (.wdb)
# wav_chk:		Opening waveform file of behavior or timing simulation
# bit_gen:		Generating the bitstream file (.bit) via automatically 
# 				launching synthesis and implementation
#==========================================
# Default Vivado GUI launching flags if not specified in command line
HW_ACT ?= none
HW_VAL ?= none

# FPGA Evaluation
FPGA_RUN := $(shell pwd)/run/fpga_run.sh 

VPN_USER ?= none

BOARD_IP ?= none

.PHONY: FORCE

#==========================================
# Hardware Design
#==========================================
vivado_prj: FORCE
	@echo "Executing $(HW_ACT) for Vivado project..."
	@mkdir -p $(HW_PLATFORM)
	$(MAKE) -C ./hardware VIVADO=$(VIVADO_BIN) HW_ACT=$(HW_ACT) HW_VAL="$(HW_VAL)" O=$(HW_PLATFORM) $@

bit_bin:
	@echo "Generating .bit.bin file for system.bit..."
	$(MAKE) -C ./hardware BOOT_GEN=$(BOOT_GEN_BIN) O=$(HW_PLATFORM) $@

#==========================================
# Cloud environment usage
#==========================================
cloud_run:
ifneq (${VPN_USER},none)
	@cd $(shell pwd)/run && bash $(FPGA_RUN) $(VIVADO_BIN) y cloud $(VPN_USER) | tee ./cloud_run.log
else
	$(error Please correctly set your VPN user name)
endif

#==========================================
# Local environment usage
#==========================================
local_run:
ifneq (${BOARD_IP},none)
	@cd $(shell pwd)/run && bash $(FPGA_RUN) $(VIVADO_BIN) n local $(BOARD_IP) | tee ./local_run.log
else
	$(error Please correctly set IP address of the FPGA board)
endif

help: FORCE
	@cat help


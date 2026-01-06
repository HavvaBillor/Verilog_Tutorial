########################################################
# GENERIC VERILOG / MODELSIM MAKEFILE
# Reusable for any RTL project
########################################################

# ---- Tools ----
VLIB = vlib
VLOG = vlog
VSIM = vsim

# ---- Directories ----
RTL_DIR  = rtl
TB_DIR   = tb
WORK_DIR = work

# ---- Files ----
# ALL RTL files (generic, no hard-code)
RTL_FILES := $(wildcard $(RTL_DIR)/*.v)

# Default testbench (can be overridden)
# Example:
#   make sim TB=tb_full_adder.v
TB ?= $(notdir $(firstword $(wildcard $(TB_DIR)/*.v)))
TB_FILE := $(TB_DIR)/$(TB)

# Extract top module name from TB filename
TB_TOP := $(basename $(TB))

# Informational only (not used in build)
RTL ?= undefined

########################################################
# Targets
########################################################
.PHONY: all compile sim sim_batch clean help

all: sim

help:
	@echo "Usage:"
	@echo "  make compile"
	@echo "  make sim TB=<testbench.v>"
	@echo "  make sim_batch TB=<testbench.v>"
	@echo ""
	@echo "Notes:"
	@echo "  - All RTL files are always compiled"
	@echo "  - Only the selected testbench is simulated"
	@echo "  - RTL=<name> is informational only"

########################################################
# Compile RTL only
########################################################
compile:
	@echo "[] 1. Create work library"
	@mkdir -p $(WORK_DIR)
	$(VLIB) $(WORK_DIR)

	@echo "[] 2. Compile all RTL files"
	$(VLOG) -work $(WORK_DIR) $(RTL_FILES)

	@echo "[✓] RTL compile completed"

########################################################
# GUI simulation
########################################################
sim:
	@echo "[] 1. Create work library"
	@mkdir -p $(WORK_DIR)
	$(VLIB) $(WORK_DIR)

	@echo "[] 2. Compile RTL + selected TB"
	$(VLOG) -work $(WORK_DIR) $(RTL_FILES) $(TB_FILE)

	@echo "[] 3. Launch ModelSim (GUI)"
	$(VSIM) -work $(WORK_DIR) $(TB_TOP)

########################################################
# Batch simulation
########################################################
sim_batch:
	@echo "[] 1. Create work library"
	@mkdir -p $(WORK_DIR)
	$(VLIB) $(WORK_DIR)

	@echo "[] 2. Compile RTL + selected TB"
	$(VLOG) -work $(WORK_DIR) $(RTL_FILES) $(TB_FILE)

	@echo "[] 3. Run ModelSim (Batch)"
	$(VSIM) -c -work $(WORK_DIR) $(TB_TOP) -do "run -all; quit"

########################################################
# Clean
########################################################
clean:
	rm -rf $(WORK_DIR) transcript vsim.wlf
	@echo "[✓] Clean completed"


########################################################
# KULLANIM ÖRNEKLERİ
########################################################
#
# 1) Tüm RTL dosyalarını derle
#    (rtl/ klasörü altındaki bütün .v dosyaları)
#
#    make compile
#
#
# 2) GUI (ModelSim) simülasyonu
#    Varsayılan testbench:
#    tb/ klasöründeki ilk bulunan tb_*.v dosyası kullanılır
#
#    make sim
#
#
# 3) GUI simülasyonu – belirli bir testbench ile
#
#    make sim TB=tb_half_adder.v
#
#    make sim TB=tb_full_adder.v
#
#
# 4) Batch (terminal) simülasyonu
#
#    make sim_batch TB=tb_half_adder.v
#
#    make sim_batch TB=tb_full_adder.v
#
#
# 5) RTL parametresi (bilgi amaçlıdır)
#    Derlemeyi etkilemez, sadece not amaçlı kullanılır
#
#    make sim RTL=full_adder TB=tb_full_adder.v
#
#
# 6) Çalışma dizinini temizle
#
#    make clean
#
#
# NOTLAR:
# - Tüm simülasyonlarda:
#     * rtl/ altındaki TÜM RTL dosyaları derlenir
#     * sadece seçilen testbench simüle edilir
#
# - Makefile modül ismine bağlı değildir
#   (half_adder, full_adder, başka projeler…)
#
########################################################

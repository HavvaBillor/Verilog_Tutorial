# --- Ayarlar ---
RTL_DIR := rtl
TB_DIR  := tb
WORK_DIR := work

RTL_TOP_MODULE := $(basename $(notdir $(firstword $(wildcard $(RTL_DIR)/*.v))))
TB_TOP_MODULE  := $(basename $(notdir $(firstword $(wildcard $(TB_DIR)/*.v))))

SYNTH_JSON := synth.json

# --- Araçlar ---
VLIB := vlib
VLOG := vlog
VSIM := vsim
YOSYS := yosys
GTK := gtkwave

# --- Dosyalar ---
RTL_FILES := $(wildcard $(RTL_DIR)/*.v)
TB_FILES  := $(wildcard $(TB_DIR)/*.v)
ALL_FILES := $(TB_FILES) $(RTL_FILES)

# --- Hedefler ---
.PHONY: all setup compile sim sim_cli sim_batch synth show clean

all: sim

# --- Simülasyon ---

setup:
	@echo "[] 1. vlib work"
	@if [ ! -d $(WORK_DIR) ]; then $(VLIB) $(WORK_DIR); fi

compile: setup
	@echo "[] 2. vlog"
	$(VLOG) -work $(WORK_DIR) $(ALL_FILES)

# GUI ile simülasyon
sim: compile
	@echo "[] 3. vsim (GUI mod)"
	$(VSIM) -work $(WORK_DIR) $(TB_TOP_MODULE)
	@echo "[✓] GUI simülasyon tamamlandı."

# CLI ile simülasyon
sim_cli: compile
	@echo "[] 3. vsim (CLI mod)"
	$(VSIM) -c -work $(WORK_DIR) $(TB_TOP_MODULE) -do "run -all; quit"
	@echo "[✓] CLI simülasyon tamamlandı."

# Batch simülasyon (CLI, otomatik)
sim_batch: compile
	$(VSIM) -c -work $(WORK_DIR) $(TB_TOP_MODULE) -do "run -all; quit"

# --- Sentez ---
synth:
	$(YOSYS) -p "read_verilog $(RTL_FILES); synth -top $(RTL_TOP_MODULE); write_json $(SYNTH_JSON)"
	@echo "[✓] Sentez tamamlandı."

# --- Temizlik ---
clean:
	rm -rf $(WORK_DIR) transcript vsim.wlf $(SYNTH_JSON)
	@echo "[✓] Temizlik tamamlandı."

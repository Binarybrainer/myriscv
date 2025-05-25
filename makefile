# Paths
OUT_DIR := output
OUT_BIN := $(OUT_DIR)/sim.out
FILELIST := filelist.txt

# Default target
all: $(OUT_BIN)

# Build simulation binary from file list
$(OUT_BIN): $(FILELIST) | $(OUT_DIR)
	iverilog -o $@ $(shell cat $(FILELIST))

# Create output directory if not exists
$(OUT_DIR):
	mkdir -p $(OUT_DIR)

# Run the simulation
run: $(OUT_BIN)
	vvp $(OUT_BIN)

# Clean build files
clean:
	rm -rf $(OUT_DIR)

.PHONY: all run clean


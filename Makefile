# Makefile for LaTeX project

# Main document name (without extension)
MAIN = src/main

# Output directory for build files
OUT_DIR = build

# PDF viewer (optional)
PDF_VIEWER = open

# LaTeX compiler command
LATEXMK = latexmk
LATEXMK_FLAGS = -pdf -output-directory=$(OUT_DIR) -auxdir=$(OUT_DIR) -interaction=nonstopmode -file-line-error

# Clean-up files (auxiliary files generated during compilation)
CLEAN_FILES = $(OUT_DIR)/*.aux $(OUT_DIR)/*.bbl $(OUT_DIR)/*.blg $(OUT_DIR)/*.fdb_latexmk $(OUT_DIR)/*.fls \
              $(OUT_DIR)/*.log $(OUT_DIR)/*.out $(OUT_DIR)/*.toc $(OUT_DIR)/*.synctex.gz

# Default target: compile the PDF
all: $(OUT_DIR)/main.pdf

# Rule to compile the LaTeX document
$(OUT_DIR)/main.pdf: $(MAIN).tex $(wildcard src/*.tex) $(wildcard bib/*.bib)
	$(LATEXMK) $(LATEXMK_FLAGS) $(MAIN)

# Rule to clean the auxiliary files
clean:
	@rm -f $(CLEAN_FILES)

# Rule to clean everything including the PDF
cleanall: clean
	@rm -f $(OUT_DIR)/main.pdf

# Rule to open the PDF after building
view: $(OUT_DIR)/main.pdf
	$(PDF_VIEWER) $(OUT_DIR)/main.pdf

.PHONY: all clean cleanall view
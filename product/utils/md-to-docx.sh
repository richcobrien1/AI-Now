#!/bin/bash

# Directory where your markdown files are stored
INPUT_DIR="./guides"

# Output folder
OUTPUT_DIR="./exports"
mkdir -p "$OUTPUT_DIR"

# Path to your Word template (update with actual path)
TEMPLATE="./v2u_template.docx"

# Loop through all .md files
for file in "$INPUT_DIR"/*.md; do
    filename=$(basename "$file" .md)
    pandoc "$file" -o "$OUTPUT_DIR/${filename}.docx" --reference-doc="$TEMPLATE"
    echo "Converted: $filename.md → ${filename}.docx"
done

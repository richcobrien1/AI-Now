#!/bin/bash

PDF_META=(--metadata mainfont="Symbola" --metadata emoji=true)
PDF_METADATA=(
  --metadata=mainfont="Symbola"
  --metadata=emoji=true
  --pdf-engine=xelatex
)

# Add this to top of script
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# Then set source path like this:
SOURCE_DIR="$SCRIPT_DIR/source"

ROOT_DIR="./product/guides"
PUBLISH_DIR="$ROOT_DIR/publish"
TEMPLATE="$ROOT_DIR/v2u_template.dotx"

VERSION="1.0"
TODAY=$(date +%F)

# Build number tracker
BUILD_META="$ROOT_DIR/build.meta"
if [ ! -f "$BUILD_META" ]; then echo "0" > "$BUILD_META"; fi
BUILD_NUM=$(($(cat "$BUILD_META") + 1))
echo "$BUILD_NUM" > "$BUILD_META"
BUILD_TAG="Build-$(printf "%04d" $BUILD_NUM)"

# Initialize manifest and changelog
MANIFEST="$ROOT_DIR/manifest.csv"
CHANGELOG="$ROOT_DIR/build.log"

echo "AppName,Version,Build,Date,Output_DOCX,Output_PDF,Output_ZIP" > "$MANIFEST"
echo "🔨 $TODAY — $BUILD_TAG: Exported Markdown guides to DOCX+PDF+ZIP" >> "$CHANGELOG"

mkdir -p "$PUBLISH_DIR"

shopt -s nullglob  # Enables empty glob evaluation

md_files=("$SOURCE_DIR"/*.md)
if [ ${#md_files[@]} -eq 0 ]; then
  echo "⚠️  No .md files found in $SOURCE_DIR"
  exit 1
fi

for filepath in "$SOURCE_DIR"/*.md; do
    filename=$(basename "$filepath" .md)
    temp_dir="$PUBLISH_DIR/$filename"
    mkdir -p "$temp_dir"

    # Convert to DOCX
    pandoc "$filepath" -o "$temp_dir/${filename}.docx" --reference-doc="$TEMPLATE"

    # Convert to PDF
    pandoc "$filepath" -o "$temp_dir/${filename}.pdf" "${PDF_METADATA[@]}"

    # Generate dynamic README
    cat <<EOF > "$temp_dir/README.txt"
# Mastering ${filename//_/ } Guide
Version: $VERSION
Build: $BUILD_TAG
Date: $TODAY

This package includes:
- ${filename}.docx
- ${filename}.pdf
- README.txt

---

## Licensing

🟢 Standard Edition
- Personal or internal team use
- Redistribution prohibited
- No resale rights

🟣 Premium Edition
- Editable templates included
- Lifetime updates
- May be used in client projects (non-resale)

> To upgrade or get licensing: support@v2u.us

© $TODAY v2u. All rights reserved.
EOF

    # Create ZIP
    (cd "$temp_dir" && zip -r "../${filename}.zip" .)

    # Update manifest
    echo "${filename},$VERSION,$BUILD_TAG,$TODAY,${filename}.docx,${filename}.pdf,${filename}.zip" >> "$MANIFEST"

    echo "✅ Completed: ${filename} → .docx/.pdf/.zip"
done

# Generate checksum log
cd "$PUBLISH_DIR" || exit
sha256sum *.zip > ../checksums.txt
cd - >/dev/null

echo "📋 All exports built, tracked, zipped, and checksummed for $BUILD_TAG."

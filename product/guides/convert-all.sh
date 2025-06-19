#!/bin/bash

ROOT_DIR="./product/guides"
SOURCE_DIR="$ROOT_DIR/source"
PUBLISH_DIR="$ROOT_DIR/publish"
TEMPLATE="$ROOT_DIR/v2u_template.docx"
VERSION="1.0"
TODAY=$(date +%F)

mkdir -p "$PUBLISH_DIR"

for filepath in "$SOURCE_DIR"/*.md; do
    filename=$(basename "$filepath" .md)
    temp_dir="$PUBLISH_DIR/$filename"
    mkdir -p "$temp_dir"

    # Convert to DOCX
    pandoc "$filepath" -o "$temp_dir/${filename}.docx" --reference-doc="$TEMPLATE"

    # Convert to PDF
    pandoc "$filepath" -o "$temp_dir/${filename}.pdf" --pdf-engine=xelatex

    # Generate dynamic README.txt
    cat <<EOF > "$temp_dir/README.txt"
# Mastering ${filename//_/ } Guide
Version: $VERSION
Date: $TODAY

This package includes:
- ${filename}.docx
- ${filename}.pdf
- README.txt (this file)

---

## Licensing & Use

🟢 STANDARD EDITION
- Personal or internal team use
- Redistribution prohibited
- Resale not permitted

🟣 PREMIUM EDITION
- Editable templates
- Lifetime updates
- Use in paid client projects

> For commercial licensing or team bundles, contact: support@v2u.us

---

© $TODAY v2u. All rights reserved.
EOF

    # Zip contents
    (cd "$temp_dir" && zip -r "../${filename}.zip" .)
    echo "📦 Packaged: ${filename}.zip"
done

# Generate checksum log
cd "$PUBLISH_DIR" || exit
sha256sum *.zip > ../checksums.txt
cd - >/dev/null

echo "✅ All guides exported, versioned, and zipped with README + checksum log."

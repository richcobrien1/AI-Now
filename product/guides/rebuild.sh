#!/bin/bash

APP_NAME="$1"
VERSION="1.0"
TODAY=$(date +%F)
ROOT_DIR="./product/guides"
SOURCE="$ROOT_DIR/source/Mastering_${APP_NAME}.md"
PUBLISH="$ROOT_DIR/publish/${APP_NAME}"
TEMPLATE="$ROOT_DIR/v2u_template.dotx"
BUILD_META="$ROOT_DIR/build.meta"
README="$PUBLISH/README.txt"
ZIP="$ROOT_DIR/publish/Mastering_${APP_NAME}.zip"

if [ ! -f "$SOURCE" ]; then
  echo "❌ Markdown source not found for: $APP_NAME"
  exit 1
fi

mkdir -p "$PUBLISH"

# Get and increment build number
BUILD_NUM=$(($(cat "$BUILD_META") + 1))
echo "$BUILD_NUM" > "$BUILD_META"
BUILD_TAG="Build-$(printf "%04d" $BUILD_NUM)"

# Convert
pandoc "$SOURCE" -o "$PUBLISH/Mastering_${APP_NAME}.docx" --reference-doc="$TEMPLATE"
pandoc "$SOURCE" -o "$PUBLISH/Mastering_${APP_NAME}.pdf" --pdf-engine=xelatex

# Regenerate README
cat <<EOF > "$README"
# Mastering ${APP_NAME} Guide
Version: $VERSION
Build: $BUILD_TAG
Date: $TODAY

Includes:
- Mastering_${APP_NAME}.docx
- Mastering_${APP_NAME}.pdf
- README.txt

> © $TODAY v2u. All rights reserved.
EOF

# Rebuild ZIP
(cd "$PUBLISH" && zip -r "../Mastering_${APP_NAME}.zip" .)

# Update manifest
echo "${APP_NAME},$VERSION,$BUILD_TAG,$TODAY,Mastering_${APP_NAME}.docx,Mastering_${APP_NAME}.pdf,Mastering_${APP_NAME}.zip" >> "$ROOT_DIR/manifest.csv"
echo "🔁 Rebuilt: $APP_NAME → $BUILD_TAG"


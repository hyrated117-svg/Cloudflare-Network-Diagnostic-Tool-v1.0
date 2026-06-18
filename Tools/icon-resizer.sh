#!/bin/bash
# Icon Resizer Utility
# Automatically resizes and optimizes icons for various iOS/macOS platforms

set -e

echo "🖼️  Icon Resizer Utility"

INPUT_FILE="${1:-icon.png}"
OUTPUT_DIR="${2:-.}"

if [ ! -f "$INPUT_FILE" ]; then
    echo "❌ Error: Input file not found: $INPUT_FILE"
    exit 1
fi

echo "Processing: $INPUT_FILE"
echo "Output directory: $OUTPUT_DIR"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Define iOS/macOS icon sizes
declare -a SIZES=(16 20 29 32 40 60 64 76 83.5 128 167 180 192 256 512 1024)

for size in "${SIZES[@]}"; do
    # Round size for filename
    ROUNDED_SIZE=$(printf "%.0f" "$size")
    OUTPUT_FILE="${OUTPUT_DIR}/icon-${ROUNDED_SIZE}x${ROUNDED_SIZE}.png"
    
    if command -v sips &> /dev/null; then
        # Use sips (macOS)
        sips -z "$ROUNDED_SIZE" "$ROUNDED_SIZE" "$INPUT_FILE" --out "$OUTPUT_FILE" 2>/dev/null
        echo "✓ Generated ${ROUNDED_SIZE}x${ROUNDED_SIZE}"
    elif command -v convert &> /dev/null; then
        # Use ImageMagick
        convert "$INPUT_FILE" -resize "${ROUNDED_SIZE}x${ROUNDED_SIZE}" "$OUTPUT_FILE"
        echo "✓ Generated ${ROUNDED_SIZE}x${ROUNDED_SIZE}"
    else
        echo "⚠ Warning: Neither sips nor ImageMagick found"
        exit 1
    fi
done

echo ""
echo "✅ Icon resizing complete!"
echo "Icons saved to: $OUTPUT_DIR"

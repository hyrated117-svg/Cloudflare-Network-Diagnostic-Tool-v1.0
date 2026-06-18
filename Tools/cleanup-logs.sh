#!/bin/bash
# Log Cleanup Utility
# Removes old log files and compresses archives

set -e

echo "🧹 Log Cleanup Utility"

LOG_DIR="${1:-.}"
RETENTION_DAYS="${2:-30}"

echo "Log directory: $LOG_DIR"
echo "Retention: $RETENTION_DAYS days"
echo ""

if [ ! -d "$LOG_DIR" ]; then
    echo "❌ Error: Directory not found: $LOG_DIR"
    exit 1
fi

# Count files before
BEFORE=$(find "$LOG_DIR" -type f -name "*.log" | wc -l)

echo "Starting cleanup..."

# Find and remove old log files
find "$LOG_DIR" -type f -name "*.log" -mtime +"$RETENTION_DAYS" -delete
echo "✓ Removed logs older than $RETENTION_DAYS days"

# Compress recent rotated logs
find "$LOG_DIR" -type f -name "*.log.*.gz" -mtime -7 -exec gzip {} \; 2>/dev/null || true
echo "✓ Compressed recent rotated logs"

# Count files after
AFTER=$(find "$LOG_DIR" -type f -name "*.log" | wc -l)
REMOVED=$((BEFORE - AFTER))

# Calculate disk space freed
SPACE_FREED=$(du -sh "$LOG_DIR" 2>/dev/null | cut -f1)

echo ""
echo "=== Cleanup Summary ==="
echo "Files removed: $REMOVED"
echo "Directory size: $SPACE_FREED"
echo "✅ Cleanup complete!"

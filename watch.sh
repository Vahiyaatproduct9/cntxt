#!/bin/bash
# Watches for english text, Translates chinese text back to english.
#
LOG="/tmp/gemini_output.log"

touch "$LOG"

echo "Watching Gemini output (Press Ctrl+C to stop)"
echo "---"

tail -f "$LOG" | while IFS= read -r line; do
  # Check if line contains chinese charancters
  if echo "$line" | grep -qP '[\x{4e00}-\x{9fff}]'; then
    # Skip any leftover junk translations
    ENGLISH=$(echo "$line" | trans -brief zh:en 2>/dev/null)
    if [ -n "$ENGLISH" ]; then
      echo "Gemini (EN): $ENGLISH"
      echo "---"
    fi
  fi
done

#!/bin/bash
# Takes english text, Translates to chinese, Sends to Gemini via tmux

ENGLISH="$*"

if [ -z "$ENGLISH" ]; then
  echo "Usage: send.sh <your english text>"
  exit 1
fi

echo "You (EN): $ENGLISH"

#Translates english to chinese

CHINESE=$(trans -brief en:zh "$ENGLISH")
echo "Sending (ZH): $CHINESE"

tmux send-keys -t gemini "$CHINESE
"
tmux send-keys -t gemini "" Enter

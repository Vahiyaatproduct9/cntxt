#!/bin/bash
# Record voice -> transcribe -> translate -> send to gemini

AUDIO="/tmp/voice_input.wav"
TRANSCRIPT_DIR="/tmp/whisper_out"

mkdir -p "$TRANSCRIPT_DIR"

echo "Recording... (press Enter to stop)"
rec -r 16000 -c 1 -e signed -b 16 "$AUDIO" 2>/dev/null &
REC_PID=$!

#Wait for Enter key
read -r

kill $REC_PID 2>/dev/null
wait $REC_PID 2>/dev/null

echo "Transcribing..."

#Whisper transcribes audio to text and outputs to a .txt file

whisper "$AUDIO" \
  --model tiny \
  --language English \
  --output_dir "$TRANSCRIPT_DIR" \
  --output_format txt \
  2>/dev/null

# Read the transcript
TRANSCRIPT=$(cat "$TRANSCRIPT_DIR/voice_input.txt" 2>/dev/null | tr -d '\n')

if [ -z "$TRANSCRIPT" ]; then
  echo "Could not transcribe audio. Try again"
  exit 1
fi

echo "Heard: $TRANSCRIPT"

~/gemini-voice/send.sh "$TRANSCRIPT"

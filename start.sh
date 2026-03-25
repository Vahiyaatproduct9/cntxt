#!/bin/bash
# One Command Startup

# Clear old log
rm -rf /tmp/gemini_output.log

#Kill existing session
tmux kill-session -t gemini 2>/dev/null

# Start fresh tmux session
tmux new-session -d -s gemini
tmux send-keys -t gemini "gemini" Enter
sleep 2

tmux pipe-pane -o -t gemini 'ansifilter >> /tmp/gemini_output.log'

echo "Gemini Session Started"
echo ""
echo "To send typed input:  ~/gemini-voice/send.sh 'your text'"
echo "To send voice input:  ~/gemini-voice/voice.sh"
echo "To watch raw output:  tmux attach -t gemini"

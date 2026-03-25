# cntxt

Tool for:

1. Taking in voice queries with 'sox'.
2. Transcribing them from wav to txt using 'openai-whisper'.
3. Translate input from English to Chinese using 'translate-shell'.
4. Run Gemini in tmux session and send all keys from (3) to this session.
5. output is copied to another txt file and watched for changes.
6. on change, the english translations printed out in console.
7. gemini can also be watched (raw chinese) by attaching the tmux session.

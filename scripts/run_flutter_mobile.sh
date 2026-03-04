#!/bin/bash
cd "$(dirname "$0")/.."
nohup flutter run -d "SM A032F" > flutter_run.log 2>&1 &
echo "Flutter app started in background. PID: $!"
if ! pgrep -x scrcpy > /dev/null; then
  nohup scrcpy > /dev/null 2>&1 &
  sleep 1
fi
osascript -e 'tell application "System Events" to set frontmost of process "scrcpy" to true' 2>/dev/null
echo "Log file: $(pwd)/flutter_run.log"

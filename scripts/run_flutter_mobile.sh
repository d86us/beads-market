#!/bin/bash
cd "$(dirname "$0")/.."
nohup flutter run -d "SM A032F" > flutter_run.log 2>&1 &
echo "Flutter app started in background. PID: $!"
nohup scrcpy > /dev/null 2>&1 &
echo "scrcpy started in background"
echo "Log file: $(pwd)/flutter_run.log"

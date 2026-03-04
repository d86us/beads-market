#!/bin/bash
cd "$(dirname "$0")/.."
nohup flutter run -d chrome > flutter_run.log 2>&1 &
echo "Flutter app started in background. PID: $!"
echo "Log file: $(pwd)/flutter_run.log"

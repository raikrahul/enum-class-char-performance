#!/bin/bash
# Professional Local Blog Launcher
# Starts a local web server to view the Axiomatic Course properly.

PORT=8000
echo " Starting Axiomatic Course Server..."
echo " ACCESS AT: http://localhost:$PORT"
echo " Press Ctrl+C to stop."

# Check for python3
if command -v python3 &> /dev/null; then
    python3 -m http.server $PORT
else
    echo "Python3 not found. Trying python..."
    python -m SimpleHTTPServer $PORT
fi

#!/bin/bash

# Prophet Forecast App Launcher for macOS
# Double-click this file to launch the app

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Open Terminal and run the app
osascript <<EOF
tell application "Terminal"
    activate
    do script "cd '$SCRIPT_DIR' && echo '🚀 Starting Prophet Forecast App...' && echo '' && if ! command -v python3 &> /dev/null; then echo '❌ Python 3 is not installed. Please install Python 3.8+ from python.org'; exit 1; fi && if ! python3 -c 'import streamlit' 2>/dev/null; then echo '📦 Installing dependencies (this may take a few minutes)...' && pip3 install -q streamlit pandas numpy plotly && echo '✅ Dependencies installed!' && echo ''; fi && if ! python3 -c 'import prophet' 2>/dev/null; then echo '📦 Installing Prophet (this may take several minutes)...' && pip3 install -q prophet cmdstanpy && echo '✅ Prophet installed!' && echo ''; fi && echo '🌐 Starting app...' && echo '📝 The app will open in your browser automatically.' && echo '🔗 If not, go to: http://localhost:8501' && echo '' && echo 'Press Ctrl+C to stop the app.' && echo '' && streamlit run prophet_forecast_app.py --server.port=8501"
end tell
EOF

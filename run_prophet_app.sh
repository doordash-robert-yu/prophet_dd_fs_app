#!/bin/bash

# Prophet Forecast Web Application Launcher
# This script installs dependencies and starts the Streamlit app

echo "🚀 Starting Prophet Forecast Web Application..."
echo ""

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

# Check if pip is available
if ! command -v pip3 &> /dev/null; then
    echo "❌ pip3 is not installed. Please install pip."
    exit 1
fi

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Check if virtual environment exists, create if not
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "🔌 Activating virtual environment..."
source venv/bin/activate

# Install dependencies
echo "📥 Installing dependencies..."
pip install -q --upgrade pip
pip install -q -r requirements_prophet_app.txt

# Check if streamlit is installed
if ! python -c "import streamlit" &> /dev/null; then
    echo "❌ Failed to install Streamlit. Please check your internet connection and try again."
    exit 1
fi

# Start the app
echo ""
echo "✅ Starting Streamlit app..."
echo "🌐 The app will open in your browser automatically."
echo "📝 If it doesn't, navigate to: http://localhost:8501"
echo ""
echo "⚠️  Note: If Prophet is not installed, you'll see an error message."
echo "   Install it with: pip install prophet cmdstanpy"
echo ""
echo "Press Ctrl+C to stop the application."
echo ""

# Run streamlit with explicit settings
streamlit run prophet_forecast_app.py --server.port=8501 --server.address=localhost

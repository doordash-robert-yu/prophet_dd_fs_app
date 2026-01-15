@echo off
REM Prophet Forecast Web Application Launcher for Windows
REM This script installs dependencies and starts the Streamlit app

echo.
echo 🚀 Starting Prophet Forecast Web Application...
echo.

REM Check if Python is available
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python is not installed. Please install Python 3.8 or higher.
    pause
    exit /b 1
)

REM Get the directory where this script is located
cd /d "%~dp0"

REM Check if virtual environment exists, create if not
if not exist "venv" (
    echo 📦 Creating virtual environment...
    python -m venv venv
)

REM Activate virtual environment
echo 🔌 Activating virtual environment...
call venv\Scripts\activate.bat

REM Install dependencies
echo 📥 Installing dependencies...
python -m pip install -q --upgrade pip
python -m pip install -q -r requirements_prophet_app.txt

REM Check if streamlit is installed
python -c "import streamlit" >nul 2>&1
if errorlevel 1 (
    echo ❌ Failed to install Streamlit. Please check your internet connection and try again.
    pause
    exit /b 1
)

REM Start the app
echo.
echo ✅ Starting Streamlit app...
echo 🌐 The app will open in your browser automatically.
echo 📝 If it doesn't, navigate to: http://localhost:8501
echo.
echo Press Ctrl+C to stop the application.
echo.

streamlit run prophet_forecast_app.py

pause

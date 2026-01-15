@echo off
REM Prophet Forecast App Launcher for Windows
REM Double-click this file to launch the app

cd /d "%~dp0"

echo.
echo 🚀 Starting Prophet Forecast App...
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python is not installed.
    echo Please install Python 3.8+ from https://www.python.org/downloads/
    echo.
    pause
    exit /b 1
)

REM Check and install Streamlit if needed
python -c "import streamlit" >nul 2>&1
if errorlevel 1 (
    echo 📦 Installing dependencies (this may take a few minutes)...
    python -m pip install -q streamlit pandas numpy plotly
    echo ✅ Dependencies installed!
    echo.
)

REM Check and install Prophet if needed
python -c "import prophet" >nul 2>&1
if errorlevel 1 (
    echo 📦 Installing Prophet (this may take several minutes)...
    python -m pip install -q prophet cmdstanpy
    echo ✅ Prophet installed!
    echo.
)

echo 🌐 Starting app...
echo 📝 The app will open in your browser automatically.
echo 🔗 If not, go to: http://localhost:8501
echo.
echo Press Ctrl+C to stop the app.
echo.

start http://localhost:8501
streamlit run prophet_forecast_app.py --server.port=8501

pause

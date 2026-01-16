@echo off
REM Prophet Forecast App Launcher for Windows
REM Double-click this file to launch the app

REM Change to the directory where this batch file is located
cd /d "%~dp0"

echo.
echo Starting Prophet Forecast App...
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed.
    echo Please install Python 3.8+ from https://www.python.org/downloads/
    echo.
    echo Make sure to check "Add Python to PATH" during installation.
    echo.
    pause
    exit /b 1
)

REM Check if the Python app file exists
if not exist "prophet_forecast_app.py" (
    echo ERROR: prophet_forecast_app.py not found in current directory.
    echo Current directory: %CD%
    echo.
    pause
    exit /b 1
)

REM Check and install Streamlit if needed
python -c "import streamlit" >nul 2>&1
if errorlevel 1 (
    echo Installing dependencies (this may take a few minutes)...
    python -m pip install --upgrade pip
    python -m pip install -q streamlit pandas numpy plotly
    if errorlevel 1 (
        echo ERROR: Failed to install dependencies.
        echo Please check your internet connection and try again.
        pause
        exit /b 1
    )
    echo Dependencies installed!
    echo.
)

REM Check and install Prophet if needed
python -c "import prophet" >nul 2>&1
if errorlevel 1 (
    echo Installing Prophet (this may take several minutes)...
    python -m pip install -q prophet cmdstanpy
    if errorlevel 1 (
        echo ERROR: Failed to install Prophet.
        echo Please check your internet connection and try again.
        pause
        exit /b 1
    )
    echo Prophet installed!
    echo.
)

echo Starting app...
echo The app will open in your browser automatically.
echo If not, go to: http://localhost:8501
echo.
echo Press Ctrl+C to stop the app.
echo.

REM Try to open browser (may fail silently, which is OK)
start http://localhost:8501 2>nul

REM Use python -m streamlit instead of just streamlit to ensure it works
python -m streamlit run prophet_forecast_app.py --server.port=8501

if errorlevel 1 (
    echo.
    echo ERROR: Failed to start the app.
    echo Please check the error messages above.
    echo.
    pause
    exit /b 1
)

pause

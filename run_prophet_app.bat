@echo off
REM Prophet Forecast Web Application Launcher for Windows
REM This script installs dependencies and starts the Streamlit app

echo.
echo Starting Prophet Forecast Web Application...
echo.

REM Check if Python is available
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed. Please install Python 3.8 or higher.
    echo Make sure to check "Add Python to PATH" during installation.
    pause
    exit /b 1
)

REM Get the directory where this script is located
cd /d "%~dp0"

REM Check if the Python app file exists
if not exist "prophet_forecast_app.py" (
    echo ERROR: prophet_forecast_app.py not found in current directory.
    echo Current directory: %CD%
    pause
    exit /b 1
)

REM Check if requirements file exists
if not exist "requirements_prophet_app.txt" (
    echo ERROR: requirements_prophet_app.txt not found.
    echo Current directory: %CD%
    pause
    exit /b 1
)

REM Check if virtual environment exists, create if not
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
    if errorlevel 1 (
        echo ERROR: Failed to create virtual environment.
        pause
        exit /b 1
    )
)

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat
if errorlevel 1 (
    echo ERROR: Failed to activate virtual environment.
    pause
    exit /b 1
)

REM Install dependencies
echo Installing dependencies...
python -m pip install -q --upgrade pip
if errorlevel 1 (
    echo ERROR: Failed to upgrade pip.
    pause
    exit /b 1
)

python -m pip install -q -r requirements_prophet_app.txt
if errorlevel 1 (
    echo ERROR: Failed to install dependencies. Please check your internet connection and try again.
    pause
    exit /b 1
)

REM Check if streamlit is installed
python -c "import streamlit" >nul 2>&1
if errorlevel 1 (
    echo ERROR: Failed to install Streamlit. Please check your internet connection and try again.
    pause
    exit /b 1
)

REM Start the app
echo.
echo Starting Streamlit app...
echo The app will open in your browser automatically.
echo If it doesn't, navigate to: http://localhost:8501
echo.
echo Press Ctrl+C to stop the application.
echo.

REM Try to open browser (may fail silently, which is OK)
start http://localhost:8501 2>nul

REM Use python -m streamlit instead of just streamlit to ensure it works
python -m streamlit run prophet_forecast_app.py

if errorlevel 1 (
    echo.
    echo ERROR: Failed to start the app.
    echo Please check the error messages above.
    echo.
    pause
    exit /b 1
)

pause

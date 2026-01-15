# Quick Start Guide - Prophet Forecast App

## 🚀 Running the App

### Option 1: Use the Launch Script (Easiest)

**On macOS/Linux:**
```bash
cd analysis/NeuralProphet
./run_prophet_app.sh
```

**On Windows:**
```batch
cd analysis\NeuralProphet
run_prophet_app.bat
```

### Option 2: Manual Start

1. **Install dependencies:**
   ```bash
   cd analysis/NeuralProphet
   pip install -r requirements_prophet_app.txt
   ```

2. **Start the app:**
   ```bash
   streamlit run prophet_forecast_app.py
   ```

3. **Open your browser:**
   - The app should automatically open at `http://localhost:8501`
   - If not, manually navigate to: **http://localhost:8501**

## 🔧 Troubleshooting

### App doesn't start / localhost:8501 shows nothing

1. **Check if Streamlit is installed:**
   ```bash
   streamlit --version
   ```
   If not installed: `pip install streamlit`

2. **Check if the app file exists:**
   ```bash
   ls -la prophet_forecast_app.py
   ```

3. **Try running with explicit port:**
   ```bash
   streamlit run prophet_forecast_app.py --server.port=8501 --server.address=localhost
   ```

4. **Check for errors in terminal:**
   - Look for any error messages when you run the command
   - Common issues:
     - Port 8501 already in use → Try a different port: `--server.port=8502`
     - Python version incompatible → Need Python 3.8+
     - Missing dependencies → Install from requirements_prophet_app.txt

5. **Check firewall/security settings:**
   - Some security software blocks localhost connections
   - Try accessing `http://127.0.0.1:8501` instead

### Prophet not installed error

If you see an error about Prophet not being installed:
```bash
pip install prophet cmdstanpy
```

**Note:** Prophet installation can take several minutes and requires a C++ compiler.

### Browser doesn't open automatically

This is normal! Just manually navigate to:
- **http://localhost:8501** or
- **http://127.0.0.1:8501**

## 📋 What to Expect

When the app starts successfully, you should see:

1. **Terminal output** showing:
   ```
   You can now view your Streamlit app in your browser.
   Local URL: http://localhost:8501
   Network URL: http://192.168.x.x:8501
   ```

2. **Browser window** (may open automatically) showing:
   - Title: "📈 Prophet Forecast Generator"
   - File upload area
   - Sidebar with configuration options

## 🆘 Still Having Issues?

1. **Check Python version:**
   ```bash
   python3 --version
   ```
   Should be 3.8 or higher

2. **Verify all dependencies:**
   ```bash
   pip list | grep -E "streamlit|pandas|prophet|plotly"
   ```

3. **Try a minimal test:**
   ```bash
   python3 -c "import streamlit; print('OK')"
   ```

4. **Check the terminal** for any error messages when starting the app

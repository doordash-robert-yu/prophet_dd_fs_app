# Prophet Forecast Web Application

A user-friendly web interface for generating Prophet forecasts from CSV files. This application allows non-technical users to upload their data and generate professional forecasts without needing to use Databricks or write code.

## 🚀 Quick Start

### Option 1: Double-Click Launcher (Easiest)

**macOS:** Double-click `LAUNCH_APP.command`  
**Windows:** Double-click `LAUNCH_APP.bat`

The launcher will automatically install dependencies and start the app.

### Option 2: Command Line

```bash
# Install dependencies
pip install -r requirements_prophet_app.txt

# Run the app
streamlit run prophet_forecast_app.py
```

Then open http://localhost:8501 in your browser.

### Option 3: Run Scripts

**macOS/Linux:**
```bash
./run_prophet_app.sh
```

**Windows:**
```batch
run_prophet_app.bat
```

## 📋 Requirements

- Python 3.8 or higher
- See `requirements_prophet_app.txt` for dependencies

**Note:** Prophet requires CmdStan. Installation may take several minutes on first run.

## 🌐 Deploy to Streamlit Cloud

1. **Push this repository to GitHub**
2. **Go to [share.streamlit.io](https://share.streamlit.io)**
3. **Sign in with GitHub**
4. **Click "New app"**
5. **Configure:**
   - Repository: `prophet_dd_fs_app`
   - Branch: `main`
   - **Main file path:** `prophet_forecast_app.py`
   - **Python version:** 3.9 or higher (if prompted)
   - App URL: Choose a name (e.g., `prophet-dd-fs-app`)
6. **Click "Deploy"**
7. **Wait 5-10 minutes** for deployment (Prophet installation takes time - CmdStan needs to compile)

Your app will be available at: `https://[your-app-name].streamlit.app`

## 📝 CSV Format

Your CSV file must have two columns:

- **ds**: Date column (YYYY-MM-DD format recommended)
- **y**: Numeric value column

Example:
```csv
ds,y
2023-01-01,1000
2023-01-02,1200
2023-01-03,1100
```

## 🎯 Features

- 📤 **Easy CSV Upload** - Simply upload your CSV file
- ⚙️ **Configurable Model Settings** - Adjust seasonality, holidays, and forecast parameters
- 📈 **Interactive Visualizations** - View forecasts and components with interactive Plotly charts
- 📊 **Component Analysis** - Explore trend, seasonality, and holiday effects
- 💾 **Export Results** - Download forecast results as CSV files
- 🎨 **User-Friendly Interface** - Clean, intuitive design

## ⚙️ Model Configuration

### Seasonality Mode
- **Additive**: Best when seasonal fluctuations are constant over time
- **Multiplicative**: Best when seasonal fluctuations grow with the level

### Seasonality Types
- **Daily**: Captures day-to-day patterns
- **Weekly**: Captures day-of-week patterns
- **Yearly**: Captures annual patterns

### Holidays
- **US Holidays**: Built-in US holiday calendar
- **Custom Holidays**: Upload a CSV with dates and holiday names

### Forecast Settings
- **Forecast Periods**: Number of periods to forecast
- **Forecast Frequency**: D (daily), W (weekly), M (monthly), Q (quarterly), Y (yearly)

## 📦 Share with Colleagues

### Option 1: Streamlit Cloud (Recommended)
Deploy to Streamlit Cloud and share the URL. No installation needed!

### Option 2: Shareable Package
Run `./create_shareable_package.sh` to create a zip file with:
- The app files
- Double-click launchers
- Instructions

Colleagues can extract and double-click the launcher to run locally.

## 🔧 Troubleshooting

### App doesn't start
- Check if Python 3.8+ is installed: `python --version`
- Check if Streamlit is installed: `pip install streamlit`
- Check terminal for error messages

### Prophet installation issues
- Ensure you have a C++ compiler installed
- Try: `pip install cmdstanpy` separately
- On macOS: `brew install gcc`

### Port already in use
- Try a different port: `streamlit run prophet_forecast_app.py --server.port=8502`

### Browser doesn't open automatically
- Manually navigate to: http://localhost:8501

## 📁 File Structure

```
prophet_dd_fs_app/
├── prophet_forecast_app.py      # Main Streamlit app
├── requirements_prophet_app.txt # Python dependencies
├── LAUNCH_APP.command           # macOS launcher
├── LAUNCH_APP.bat               # Windows launcher
├── run_prophet_app.sh           # Shell script
├── run_prophet_app.bat          # Batch script
├── create_shareable_package.sh  # Package creator
├── .streamlit/
│   └── config.toml              # Streamlit configuration
└── README.md                    # This file
```

## 📝 License

Internal use only.

## 🔗 Resources

- [Prophet Documentation](https://facebook.github.io/prophet/)
- [Streamlit Documentation](https://docs.streamlit.io/)
- [Streamlit Cloud](https://share.streamlit.io/)

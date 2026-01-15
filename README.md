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

## 📋 Requirements

- Python 3.8 or higher
- See `requirements_prophet_app.txt` for dependencies

## 🌐 Deploy to Streamlit Cloud

1. Push this repository to GitHub
2. Go to [share.streamlit.io](https://share.streamlit.io)
3. Deploy the app (see `STREAMLIT_CLOUD_SETUP.md` for details)
4. **Main file path:** `prophet_forecast_app.py`

## 📖 Documentation

- `README_prophet_app.md` - Full documentation
- `QUICK_START.md` - Quick start guide
- `SHARING_GUIDE.md` - How to share with colleagues
- `DOUBLE_CLICK_GUIDE.md` - Double-click launcher guide
- `STREAMLIT_CLOUD_SETUP.md` - Streamlit Cloud deployment guide

## 📦 Share with Colleagues

Run `./create_shareable_package.sh` to create a zip file you can share.

## 🎯 Features

- 📤 Easy CSV upload
- ⚙️ Configurable model settings
- 📈 Interactive visualizations
- 💾 Export forecast results
- 🎨 User-friendly interface

## 📝 CSV Format

Your CSV file must have:
- **ds**: Date column (YYYY-MM-DD format recommended)
- **y**: Numeric value column

Example:
```csv
ds,y
2023-01-01,1000
2023-01-02,1200
2023-01-03,1100
```

## 🔧 Troubleshooting

See `QUICK_START.md` for troubleshooting tips.

## 📝 License

Internal use only.

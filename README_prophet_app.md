# Prophet Forecast Web Application

A user-friendly web interface for generating Prophet forecasts from CSV files. This application allows non-technical users to upload their data and generate professional forecasts without needing to use Databricks or write code.

## Features

- 📤 **Easy CSV Upload** - Simply upload your CSV file with date and value columns
- ⚙️ **Configurable Model Settings** - Adjust seasonality, holidays, and forecast parameters
- 📈 **Interactive Visualizations** - View forecasts and components with interactive Plotly charts
- 📊 **Component Analysis** - Explore trend, seasonality, and holiday effects
- 💾 **Export Results** - Download forecast results as CSV files
- 🎨 **User-Friendly Interface** - Clean, intuitive design built with Streamlit

## Requirements

- Python 3.8 or higher
- Prophet and its dependencies (see `requirements_prophet_app.txt`)

## Installation

1. **Install dependencies:**
   ```bash
   pip install -r requirements_prophet_app.txt
   ```

2. **Note:** Prophet requires CmdStan to be installed. If you encounter issues, you may need to install it separately:
   ```bash
   pip install cmdstanpy
   python -c "from cmdstanpy import install_cmdstan; install_cmdstan()"
   ```

## Usage

### Quick Start (Recommended)

**On macOS/Linux:**
```bash
./run_prophet_app.sh
```

**On Windows:**
```batch
run_prophet_app.bat
```

The script will automatically:
- Create a virtual environment (if needed)
- Install all dependencies
- Start the Streamlit app

### Manual Start

1. **Install dependencies:**
   ```bash
   pip install -r requirements_prophet_app.txt
   ```

2. **Start the application:**
   ```bash
   streamlit run prophet_forecast_app.py
   ```

3. **Open your browser:**
   - The app will automatically open in your default browser
   - If not, navigate to `http://localhost:8501`

3. **Upload your CSV file:**
   - Click "Browse files" or drag and drop your CSV
   - Ensure your CSV has columns named `ds` (date) and `y` (value)

4. **Configure model settings:**
   - Use the sidebar to adjust seasonality mode, holidays, and forecast periods
   - Upload custom holidays CSV if needed

5. **Generate forecast:**
   - Click "Generate Forecast" button
   - View results in the interactive tabs

6. **Download results:**
   - Go to the "Download" tab
   - Click "Download Forecast CSV" to save your results

## CSV Format

Your CSV file must have the following columns:

- **ds**: Date column (can be in various date formats like YYYY-MM-DD, MM/DD/YYYY, etc.)
- **y**: Numeric value column (the metric you want to forecast)

Example:
```csv
ds,y
2023-01-01,1000
2023-01-02,1200
2023-01-03,1100
```

## Custom Holidays

To use custom holidays, create a CSV file with:
- **ds**: Date column
- **holiday** (optional): Holiday name

Example:
```csv
ds,holiday
2023-12-25,Christmas
2024-01-01,New Year
```

## Model Configuration Options

### Seasonality Mode
- **Additive**: Best when seasonal fluctuations are constant over time
- **Multiplicative**: Best when seasonal fluctuations grow with the level of the time series

### Seasonality Types
- **Daily**: Captures day-to-day patterns (useful for intraday data)
- **Weekly**: Captures day-of-week patterns
- **Yearly**: Captures annual patterns

### Forecast Settings
- **Forecast Periods**: Number of periods to forecast into the future
- **Forecast Frequency**: D (daily), W (weekly), M (monthly), Q (quarterly), Y (yearly)

### Advanced Options
- **Changepoint Prior Scale**: Controls flexibility of trend changes (lower = less flexible)
- **Seasonality Prior Scale**: Controls strength of seasonality effects
- **Holidays Prior Scale**: Controls strength of holiday effects

## Troubleshooting

### Prophet Installation Issues
If you encounter errors installing Prophet:
1. Ensure you have a C++ compiler installed
2. Try installing CmdStan separately: `pip install cmdstanpy`
3. On macOS, you may need: `brew install gcc`

### Date Format Issues
If dates aren't recognized:
- Ensure dates are in a standard format (YYYY-MM-DD recommended)
- Check for any text or invalid date values in the date column

### Memory Issues
For very large datasets:
- Consider filtering your data before uploading
- Reduce forecast periods if memory is limited

## Comparison with Databricks Notebook

This web application provides the same Prophet forecasting capabilities as the Databricks notebook (`[Prophet] USMP Volume Forecasting - Additive.ipynb`) but with:

✅ **No Databricks account required**
✅ **No Snowflake connection needed** (works with local CSV files)
✅ **User-friendly interface** (no coding required)
✅ **Interactive visualizations** (Plotly charts)
✅ **Easy result export** (one-click CSV download)

## Notes

- The application runs locally on your machine
- No data is sent to external servers (all processing is local)
- Forecasts are generated using the same Prophet library as the Databricks notebook
- Results match the Databricks output format for consistency

## Sharing with Colleagues

There are several ways to share this app:

### 🚀 Option 1: Streamlit Cloud (Recommended)
**Best for:** Sharing with multiple colleagues, no technical setup required

1. Push code to GitHub
2. Go to [share.streamlit.io](https://share.streamlit.io)
3. Deploy your app (free hosting)
4. Share the URL with colleagues

**See `SHARING_GUIDE.md` for detailed instructions.**

### 🌐 Option 2: Local Network Sharing
**Best for:** Quick sharing within your office/network

1. Run the app: `streamlit run prophet_forecast_app.py`
2. Share the Network URL shown in terminal (e.g., `http://192.168.x.x:8501`)
3. Colleagues on the same network can access it

### 💻 Option 3: Share Code
**Best for:** Colleagues who want to run it themselves

Share the files and have them install dependencies and run locally.

**For complete sharing options, see `SHARING_GUIDE.md`**

## Support

For issues or questions, refer to:
- [Prophet Documentation](https://facebook.github.io/prophet/)
- [Streamlit Documentation](https://docs.streamlit.io/)
- Sharing Guide: `SHARING_GUIDE.md`

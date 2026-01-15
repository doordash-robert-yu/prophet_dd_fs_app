# Streamlit Cloud - Quick Start

## ✅ Step 1: Commit Files to GitHub

Run these commands to commit the Prophet app files:

```bash
cd "/Users/robert.yu/Desktop/Cursor Analytics/cursor-analytics"

# Add the Prophet app files
git add analysis/NeuralProphet/prophet_forecast_app.py
git add analysis/NeuralProphet/requirements_prophet_app.txt
git add analysis/NeuralProphet/.streamlit/
git add analysis/NeuralProphet/STREAMLIT_CLOUD_SETUP.md

# Commit
git commit -m "Add Prophet Forecast Streamlit app for web deployment"

# Push to GitHub
git push origin main
```

## ✅ Step 2: Deploy to Streamlit Cloud

1. **Go to:** [share.streamlit.io](https://share.streamlit.io)
2. **Sign in** with your GitHub account
3. **Click "New app"**
4. **Select:**
   - Repository: `doordash-robert-yu/cursor_analytics_finance`
   - Branch: `main`
   - Main file path: `analysis/NeuralProphet/prophet_forecast_app.py`
5. **Click "Deploy"**
6. **Wait 2-5 minutes** for deployment (Prophet installation takes time)
7. **Share the URL** with your colleagues!

## 🎯 Your App URL Will Be:
`https://[your-app-name].streamlit.app`

## 📝 Notes:
- First deployment takes longer (Prophet installation)
- The app will be publicly accessible (anyone with URL)
- Updates: Just push to GitHub and it auto-updates!

See `STREAMLIT_CLOUD_SETUP.md` for detailed instructions.

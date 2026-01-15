# Streamlit Cloud Deployment Guide

This guide will help you deploy the Prophet Forecast App to Streamlit Cloud so anyone can access it via a web URL.

## 🚀 Quick Setup Steps

### Step 1: Prepare Files for GitHub

Make sure these files are in the `analysis/NeuralProphet/` directory:
- ✅ `prophet_forecast_app.py` (main app)
- ✅ `requirements_prophet_app.txt` (dependencies)
- ✅ `.streamlit/config.toml` (optional, for configuration)

### Step 2: Commit and Push to GitHub

```bash
cd "/Users/robert.yu/Desktop/Cursor Analytics/cursor-analytics"

# Add the Prophet app files
git add analysis/NeuralProphet/prophet_forecast_app.py
git add analysis/NeuralProphet/requirements_prophet_app.txt
git add analysis/NeuralProphet/.streamlit/

# Commit
git commit -m "Add Prophet Forecast Streamlit app"

# Push to GitHub (if you have a remote)
git push origin main
```

**Note:** If you don't have a GitHub remote yet:
1. Create a new repository on GitHub
2. Add it as a remote: `git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git`
3. Push: `git push -u origin main`

### Step 3: Deploy to Streamlit Cloud

1. **Go to Streamlit Cloud:**
   - Visit: [share.streamlit.io](https://share.streamlit.io)
   - Sign in with your GitHub account

2. **Create New App:**
   - Click "New app" button
   - Select your GitHub account
   - Choose your repository
   - Select the branch (usually `main` or `master`)

3. **Configure App:**
   - **Main file path:** `analysis/NeuralProphet/prophet_forecast_app.py`
   - **App URL:** Choose a custom name (e.g., `prophet-forecast-app`)
   - Click "Deploy"

4. **Wait for Deployment:**
   - First deployment takes 2-5 minutes
   - Streamlit Cloud will install dependencies automatically
   - You'll see progress in the deployment log

5. **Share the URL:**
   - Once deployed, you'll get a URL like: `https://prophet-forecast-app.streamlit.app`
   - Share this URL with your colleagues!

## 📋 Important Notes

### File Structure
Streamlit Cloud needs to find the app file. Make sure the path is correct:
- If your repo structure is: `repo/analysis/NeuralProphet/prophet_forecast_app.py`
- Then the main file path should be: `analysis/NeuralProphet/prophet_forecast_app.py`

### Requirements File
The `requirements_prophet_app.txt` file must be in the same directory as the app file, or Streamlit Cloud won't find it.

### Prophet Installation
Prophet installation on Streamlit Cloud may take several minutes during the first deployment. This is normal!

### Public vs Private
- **Public repos:** Free, unlimited apps
- **Private repos:** Free for up to 3 private apps
- Your app URL is public (anyone with the link can access it)

## 🔒 Security Considerations

**Current Setup:**
- App is publicly accessible (anyone with URL can use it)
- No authentication required
- Data is processed in the cloud (not on your machine)

**For Sensitive Data:**
- Consider adding authentication (Streamlit Cloud supports this)
- Or use the local double-click launcher instead
- Or deploy to a private cloud instance

## 🛠️ Troubleshooting

### App Won't Deploy

**Error: "Module not found"**
- Check that `requirements_prophet_app.txt` includes all dependencies
- Make sure the file path is correct

**Error: "File not found"**
- Verify the main file path is correct
- Check that the file exists in your GitHub repo

**Prophet Installation Fails**
- Prophet requires CmdStan which can be slow to install
- Wait 5-10 minutes for first deployment
- Check the deployment logs for specific errors

### App Deploys But Shows Errors

**Check the logs:**
- Click "Manage app" → "Logs"
- Look for error messages
- Common issues:
  - Missing dependencies
  - Import errors
  - File path issues

## 🔄 Updating Your App

To update the app:
1. Make changes to `prophet_forecast_app.py`
2. Commit and push to GitHub:
   ```bash
   git add analysis/NeuralProphet/prophet_forecast_app.py
   git commit -m "Update Prophet app"
   git push
   ```
3. Streamlit Cloud will automatically redeploy (usually within 1-2 minutes)

## 📊 Monitoring

- **View app stats:** Click "Manage app" in Streamlit Cloud
- **View logs:** Check deployment and runtime logs
- **Restart app:** Use "Restart app" button if needed

## 🎯 Next Steps After Deployment

1. **Test the app:** Open the URL and test with a sample CSV
2. **Share with colleagues:** Send them the Streamlit Cloud URL
3. **Bookmark:** Save the URL for easy access
4. **Monitor usage:** Check Streamlit Cloud dashboard for usage stats

## 💡 Tips

- **Custom domain:** Streamlit Cloud doesn't support custom domains on free tier
- **Resource limits:** Free tier has reasonable limits (usually sufficient)
- **Multiple apps:** You can deploy multiple apps from the same repo
- **Version control:** All changes are tracked via GitHub

## 📞 Need Help?

- [Streamlit Cloud Documentation](https://docs.streamlit.io/streamlit-community-cloud)
- [Streamlit Community Forum](https://discuss.streamlit.io/)
- Check deployment logs for specific error messages

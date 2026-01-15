#!/bin/bash

# Script to commit and push prophet_dd_fs_app to GitHub

cd "/Users/robert.yu/Desktop/prophet_dd_fs_app"

echo "📋 Staging all files..."
git add -A

echo ""
echo "💾 Committing changes..."
git commit -m "Initial commit: Prophet Forecast Web Application - Clean repository ready for deployment"

echo ""
echo "📤 Pushing to GitHub..."
echo "Repository: https://github.com/doordash-robert-yu/prophet_dd_fs_app"
echo ""
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully pushed to GitHub!"
    echo "🌐 Repository: https://github.com/doordash-robert-yu/prophet_dd_fs_app"
    echo ""
    echo "Next steps:"
    echo "1. Deploy to Streamlit Cloud: https://share.streamlit.io"
    echo "2. Main file: prophet_forecast_app.py"
else
    echo ""
    echo "❌ Push failed. Possible reasons:"
    echo "1. GitHub repository doesn't exist yet - create it at: https://github.com/new"
    echo "   - Name: prophet_dd_fs_app"
    echo "   - Don't initialize with README"
    echo ""
    echo "2. Authentication required - you may need to enter your GitHub credentials"
    echo ""
    echo "3. Check your internet connection"
fi

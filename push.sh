#!/bin/bash

# Push prophet_dd_fs_app to GitHub

cd "/Users/robert.yu/Desktop/prophet_dd_fs_app"

echo "📋 Staging all files..."
git add -A

echo ""
echo "💾 Committing changes..."
git commit -m "Initial commit: Prophet Forecast Web Application" || echo "Already committed"

echo ""
echo "📤 Pushing to GitHub..."
echo "Repository: https://github.com/doordash-robert-yu/prophet_dd_fs_app"
echo ""
git push -u origin main

echo ""
if [ $? -eq 0 ]; then
    echo "✅ Successfully pushed to GitHub!"
    echo "🌐 View at: https://github.com/doordash-robert-yu/prophet_dd_fs_app"
else
    echo "❌ Push failed. Check error messages above."
fi

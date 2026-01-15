#!/bin/bash

# Quick push script for prophet_dd_fs_app

cd "/Users/robert.yu/Desktop/prophet_dd_fs_app"

echo "🚀 Pushing to GitHub..."
echo ""

# Stage all files
echo "📋 Staging files..."
git add -A

# Commit
echo "💾 Committing..."
git commit -m "Initial commit: Prophet Forecast Web Application" 2>&1

# Push
echo "📤 Pushing to GitHub..."
echo "Repository: https://github.com/doordash-robert-yu/prophet_dd_fs_app"
echo ""
git push -u origin main

echo ""
echo "✅ Done! Check: https://github.com/doordash-robert-yu/prophet_dd_fs_app"

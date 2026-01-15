#!/bin/bash

# Script to push prophet_dd_fs_app to GitHub

cd "/Users/robert.yu/Desktop/prophet_dd_fs_app"

echo "📋 Checking git status..."
git status

echo ""
echo "📝 Staging all changes..."
git add -A

echo ""
echo "💾 Committing changes..."
git commit -m "Clean up repository for GitHub push" || echo "No changes to commit"

echo ""
echo "🔍 Checking for remote..."
if git remote -v | grep -q "origin"; then
    echo "✅ Remote 'origin' found"
    git remote -v
    echo ""
    echo "📤 Pushing to GitHub..."
    git push -u origin main
else
    echo "❌ No remote configured"
    echo ""
    echo "To push to GitHub, you need to:"
    echo "1. Create a repository on GitHub: https://github.com/new"
    echo "   - Name: prophet_dd_fs_app"
    echo "   - Don't initialize with README"
    echo ""
    echo "2. Then run:"
    echo "   git remote add origin https://github.com/YOUR_USERNAME/prophet_dd_fs_app.git"
    echo "   git push -u origin main"
    echo ""
    echo "Replace YOUR_USERNAME with your GitHub username"
fi

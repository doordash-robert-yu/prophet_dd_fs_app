#!/bin/bash

# Script to create a shareable package of the Prophet Forecast App

echo "📦 Creating shareable package..."
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# Create package directory
PACKAGE_NAME="ProphetForecastApp"
rm -rf "$PACKAGE_NAME"
mkdir -p "$PACKAGE_NAME"

# Copy necessary files
echo "📋 Copying files..."
cp prophet_forecast_app.py "$PACKAGE_NAME/"
cp requirements_prophet_app.txt "$PACKAGE_NAME/"
cp LAUNCH_APP.command "$PACKAGE_NAME/"
cp LAUNCH_APP.bat "$PACKAGE_NAME/"
cp README_prophet_app.md "$PACKAGE_NAME/"
cp DOUBLE_CLICK_GUIDE.md "$PACKAGE_NAME/"
cp QUICK_START.md "$PACKAGE_NAME/" 2>/dev/null || true

# Make launchers executable
chmod +x "$PACKAGE_NAME/LAUNCH_APP.command"

# Create a simple README for the package
cat > "$PACKAGE_NAME/START_HERE.txt" << 'EOF'
╔══════════════════════════════════════════════════════════════╗
║         Prophet Forecast App - Quick Start Guide            ║
╚══════════════════════════════════════════════════════════════╝

🚀 TO START THE APP:

macOS Users:
  → Double-click "LAUNCH_APP.command"

Windows Users:
  → Double-click "LAUNCH_APP.bat"

📋 REQUIREMENTS:
  • Python 3.8 or higher must be installed
  • Check: Open Terminal/CMD and type: python --version
  • Download Python: https://www.python.org/downloads/

⏱️ FIRST TIME SETUP:
  • The first time you run it, it will install dependencies
  • This may take 5-10 minutes
  • You only need to do this once

🌐 USING THE APP:
  • The app will open in your web browser automatically
  • If not, go to: http://localhost:8501
  • Upload a CSV file with 'ds' (date) and 'y' (value) columns
  • Configure settings and generate forecasts!

❓ NEED HELP?
  • See README_prophet_app.md for detailed instructions
  • See DOUBLE_CLICK_GUIDE.md for troubleshooting

EOF

# Create zip file
echo "📦 Creating zip file..."
zip -r "${PACKAGE_NAME}.zip" "$PACKAGE_NAME" -x "*.DS_Store" "*.pyc" "__pycache__/*"

# Clean up
rm -rf "$PACKAGE_NAME"

echo ""
echo "✅ Package created successfully!"
echo ""
echo "📁 File: ${PACKAGE_NAME}.zip"
echo "📏 Size: $(du -h ${PACKAGE_NAME}.zip | cut -f1)"
echo ""
echo "📤 You can now share this zip file with your colleagues!"
echo "   They just need to extract it and double-click the launcher."

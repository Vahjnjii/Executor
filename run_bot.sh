#!/bin/bash
#
# Telegram Bot Startup Script
# Starts the video generation Telegram bot
#

echo "========================================================================"
echo "🤖 STARTING TELEGRAM BOT"
echo "========================================================================"

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 not found! Please install Python 3"
    exit 1
fi

# Check if api_keys.txt exists
if [ ! -f "api_keys.txt" ]; then
    echo "⚠️  Warning: api_keys.txt not found!"
    echo "   Please create api_keys.txt with your Google Gemini API keys"
    echo "   You can copy api_keys.example.txt as a template"
    exit 1
fi

# Check if required modules are installed
echo "📦 Checking dependencies..."
python3 -c "import requests" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "❌ Missing dependency: requests"
    echo "   Install with: pip install requests"
    exit 1
fi

echo "✅ Dependencies OK"
echo ""

# Start the bot
echo "🚀 Starting bot..."
echo "   Press Ctrl+C to stop"
echo ""

python3 telegram_bot.py

# On exit
echo ""
echo "========================================================================"
echo "👋 Bot stopped"
echo "========================================================================"

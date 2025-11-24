# 🤖 Telegram Bot Guide

Complete guide for using the Video Generation Telegram Bot!

## 🚀 Quick Start

### 1. Start the Bot

```bash
# Make sure you're in the project directory
python telegram_bot.py
```

You should see:
```
======================================================================
🤖 TELEGRAM BOT STARTING
======================================================================
✅ Bot token configured
⏳ Waiting for messages...
```

### 2. Find Your Bot on Telegram

Open Telegram and search for your bot (use the bot username from @BotFather)

### 3. Start Conversation

Send `/start` to see all available commands!

## 📋 Available Commands

### 🎤 `/voiceover` - Generate Voiceover Only

Generates AI voiceover and sends audio file back to you.

**Usage:**
```
/voiceover Your text here
```

**Batch Mode:**
```
/voiceover Script 1 --- Script 2 --- Script 3
```

**Examples:**
```
/voiceover Hello! Welcome to my channel.

/voiceover Amazing fact about space --- Cool tech tip --- Funny joke
```

**What happens:**
1. Bot generates voiceover(s) from your text
2. Sends audio file(s) back to you
3. You can use these audio files anywhere
4. **Process stops here** (independent execution)

---

### 📝 `/subtitle` - Generate Subtitles Only

Generates subtitles from audio file.

**Usage:**
1. Send an audio file to the bot
2. Reply to that audio with `/subtitle`

**What happens:**
1. Bot transcribes the audio
2. Generates subtitle timing
3. Sends .srt file back to you
4. **Process stops here** (independent execution)

---

### 🎬 `/video` - Generate Complete Video

Generates complete video with voiceover, subtitles, background, and music.

**Usage:**
```
/video Your script text here
```

**Batch Mode:**
```
/video Script 1 --- Script 2 --- Script 3
```

**Examples:**
```
/video Amazing travel destinations you must visit!

/video Tip 1: Stay hydrated --- Tip 2: Exercise daily --- Tip 3: Sleep well
```

**What happens:**
1. Generates voiceover from script
2. Creates subtitles automatically
3. Selects random background video
4. Adds background music
5. Composes everything together
6. Sends final video to you
7. **Complete pipeline execution**

---

## 🎨 Workflow Modes

The system has **flexible workflow control**:

### Mode 1: Standalone (Default for individual commands)

Each step is **independent** and sends results immediately:

```
/voiceover text → Generates audio → Sends to Telegram ✅ DONE

/subtitle (on audio) → Generates SRT → Sends to Telegram ✅ DONE

/video text → Full pipeline → Sends video → ✅ DONE
```

### Mode 2: Pipeline (Used by /video command)

Steps chain together, only final result sent:

```
/video text → Generate voiceover → Generate subtitles → Compose video → Send video ✅
```

### Mode 3: Auto (Smart mode)

Automatically determines based on command used.

## 🔄 Batch Processing

Use `---` (three dashes) to separate multiple items:

### Batch Voiceovers:
```
/voiceover Script 1 --- Script 2 --- Script 3
```
→ Sends 3 separate audio files

### Batch Videos:
```
/video Script 1 --- Script 2 --- Script 3
```
→ Sends 3 separate videos

### Progress Updates:
Bot sends real-time updates:
```
🎤 Batch Voiceover Generation
Generating 3 voiceovers...

⏳ Generating voiceover 1/3...
✅ Voiceover 1 sent

⏳ Generating voiceover 2/3...
✅ Voiceover 2 sent

⏳ Generating voiceover 3/3...
✅ Voiceover 3 sent

✅ Batch Complete!
Successful: 3/3
```

## 🎯 Use Cases

### Use Case 1: Quick Voiceovers for Social Media

**Goal:** Generate multiple voiceovers for TikTok videos

**Command:**
```
/voiceover Fact 1: Amazing --- Fact 2: Incredible --- Fact 3: Mindblowing
```

**Result:** 3 audio files sent to Telegram, ready to use!

---

### Use Case 2: Create Subtitles for Existing Audio

**Goal:** Add subtitles to your podcast episode

**Steps:**
1. Send podcast audio to bot
2. Reply with `/subtitle`

**Result:** SRT file sent to Telegram, ready to use in video editor!

---

### Use Case 3: Complete Video Pipeline

**Goal:** Create TikTok video with everything

**Command:**
```
/video Amazing life hack that will change your routine forever!
```

**Result:** Complete video with voiceover, subtitles, background, and music!

---

### Use Case 4: Bulk Video Generation

**Goal:** Create 10 videos for the week

**Command:**
```
/video Monday tip --- Tuesday tip --- Wednesday tip --- Thursday tip --- Friday tip
```

**Result:** 5 complete videos ready to post!

## ⚙️ Configuration

### Bot Token

Your bot token is already configured:
- Stored in `config.py` (default)
- Or create `telegram_token.txt` file (recommended for security)

### API Keys

Your Google Gemini API keys are stored securely in `api_keys.txt`

### Customization

Edit `config.py` to change:
- Default voice (Puck, Charon, Kore, Fenrir, Aoede)
- Default aspect ratio (9:16, 4:5, 16:9, 1:1)
- Default quality (High/Standard)
- Video encoding settings
- Subtitle timing

## 📱 Usage Tips

### Tip 1: Keep Scripts Concise
- Shorter scripts = faster generation
- Aim for 30-60 seconds per video
- Use batch mode for multiple short videos

### Tip 2: Use Descriptive Text
- Clear, natural language works best
- Avoid special characters
- Use proper punctuation for better pacing

### Tip 3: Batch Processing for Efficiency
- Generate multiple items at once
- Bot processes them sequentially
- All results sent when complete

### Tip 4: Save Your Outputs
- Download files from Telegram immediately
- Organize in folders by date/topic
- Keep .srt files with corresponding audio/video

## 🔧 Troubleshooting

### Bot not responding

**Problem:** No reply after sending command

**Solutions:**
1. Check if bot is running: `python telegram_bot.py`
2. Verify bot token is correct
3. Check API keys are loaded
4. Look at terminal for error messages

### "API quota exceeded"

**Problem:** Too many requests

**Solution:** System automatically rotates through 18 API keys. If all exhausted, wait or add more keys in `api_keys.txt`

### Video generation taking long

**Problem:** `/video` command takes several minutes

**This is normal!** Video generation includes:
1. TTS generation (30s)
2. Transcription (30s)
3. Video composition (2-5 min)
4. Upload to Telegram (1-2 min)

**Total:** 4-7 minutes per video

### Batch mode not working

**Problem:** Bot treats `---` as part of text

**Solution:** Make sure to use exactly three dashes with spaces:
- ✅ `Script 1 --- Script 2`
- ❌ `Script 1 -- Script 2` (two dashes)
- ❌ `Script 1 ----Script 2` (four dashes, no space)

## 📊 Bot Commands Summary

| Command | Function | Output | Mode |
|---------|----------|--------|------|
| `/start` | Show help | Info message | - |
| `/voiceover text` | Generate audio | Audio file(s) | Standalone |
| `/subtitle` | Generate subs | SRT file | Standalone |
| `/video text` | Complete video | Video file(s) | Pipeline |

## 🎬 Complete Example Session

```
You: /start
Bot: 🎬 Welcome to Video Generation Bot! ...

You: /voiceover Hello! This is a test.
Bot: 🎤 Generating voiceover with Puck voice...
Bot: [Sends audio file]
Bot: ✅ Voiceover generated successfully!

You: /video Amazing travel tips for budget travelers!
Bot: 🎬 Generating video...
     ⏳ This may take a few minutes...
Bot: [Sends video file]
Bot: ✅ Video generated successfully!

You: /voiceover Tip 1 --- Tip 2 --- Tip 3
Bot: 🎤 Batch Voiceover Generation
     Generating 3 voiceovers...
Bot: [Sends 3 audio files]
Bot: ✅ Batch Complete! Successful: 3/3
```

## 🚀 Advanced Usage

### Custom Voice Selection (Coming Soon)

```
/voiceover voice:Charon Your text here
```

### Custom Aspect Ratio (Coming Soon)

```
/video aspect:16:9 quality:high Your script
```

### Pipeline Control (Coming Soon)

```
/pipeline voiceover+subtitle Your text here
```

## 📞 Support

If you encounter issues:

1. Check terminal output where bot is running
2. Verify API keys in `api_keys.txt`
3. Check Telegram bot token
4. Review `config.py` settings
5. Check file permissions in `exports/` folder

## 🎉 You're Ready!

Start generating amazing content with your Telegram bot!

```
python telegram_bot.py
```

Then open Telegram and send `/start` to your bot! 🚀

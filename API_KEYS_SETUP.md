# 🔑 API Keys Setup Guide

Your API keys are now stored securely in a separate file that is NOT committed to Git!

## 📁 Files

- **`api_keys.txt`** - Your actual API keys (✅ PROTECTED by .gitignore)
- **`api_keys.example.txt`** - Example template for others
- **`.gitignore`** - Prevents api_keys.txt from being committed

## ✅ Your Keys Are Already Set Up!

I've already created `api_keys.txt` with your 18 Google Gemini API keys:

```
✅ api_keys.txt created with 18 keys
✅ .gitignore configured to protect it
✅ config.py updated to load from file
```

## 🔄 How It Works

When you run any script, `config.py` automatically:

1. Looks for `api_keys.txt` in the project directory
2. Loads all API keys (one per line)
3. Ignores empty lines and comments (lines starting with #)
4. Provides them to the system for rotation

## 🧪 Test Your Setup

```bash
# Test if keys are loaded
python -c "from config import GOOGLE_GEMINI_API_KEYS; print(f'Loaded {len(GOOGLE_GEMINI_API_KEYS)} keys')"

# Should output: ✅ Loaded 18 API keys from api_keys.txt
#                Loaded 18 keys
```

## 📝 Adding More Keys

To add more API keys, simply edit `api_keys.txt`:

```bash
nano api_keys.txt
# or
vim api_keys.txt
# or open in any text editor
```

Add one key per line:

```
AIzaSyXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
AIzaSyYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
# This is a comment - will be ignored
AIzaSyZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
```

## 🔒 Security

Your API keys are protected:

- ✅ NOT committed to Git (protected by .gitignore)
- ✅ NOT visible in code
- ✅ Stored in separate file
- ✅ Easy to update without changing code

## 🚀 Using in Kaggle

When uploading to Kaggle:

1. **Upload all .py files** (config.py, voiceover_generator.py, etc.)
2. **Create api_keys.txt in Kaggle** with your keys:

```python
# In Kaggle notebook cell:
with open('api_keys.txt', 'w') as f:
    f.write('''AIzaSyDqGyjRIRXBlizFJ_QlS14rumbb5CfVDws
AIzaSyBOZhRB8pM05akUTf7VybuAO9KbqimYkiI
AIzaSyAmiG-HdsJcproHvccfOpeHXRVXadSz0nY
... (all your keys)
''')

# Then import and use
from voiceover_generator import generate_tts_audio
audio, status = generate_tts_audio("Test", "Puck")
```

3. **Or use Kaggle Secrets** (recommended for Kaggle):

```python
from kaggle_secrets import UserSecretsClient
secrets = UserSecretsClient()
api_key = secrets.get_secret("GEMINI_API_KEY")

# Write to api_keys.txt
with open('api_keys.txt', 'w') as f:
    f.write(api_key)
```

## 🆘 Troubleshooting

### "No API keys found"

**Problem:** api_keys.txt doesn't exist or is empty

**Solution:**
```bash
# Check if file exists
ls -la api_keys.txt

# View contents
cat api_keys.txt

# If missing, copy from example
cp api_keys.example.txt api_keys.txt
# Then add your real keys
```

### "API key invalid"

**Problem:** Keys might have extra spaces or invalid format

**Solution:**
```bash
# Make sure each key is on its own line with no extra spaces
# Good:
AIzaSyXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

# Bad:
  AIzaSyXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  (spaces around)
```

### Check if keys are loaded

```python
from config import GOOGLE_GEMINI_API_KEYS
print(f"Keys loaded: {len(GOOGLE_GEMINI_API_KEYS)}")
if GOOGLE_GEMINI_API_KEYS:
    print(f"First key: {GOOGLE_GEMINI_API_KEYS[0][:10]}...")
```

## 📋 Current Keys

You currently have **18 API keys** configured for automatic rotation.

When one key hits quota limit, the system automatically switches to the next one!

## 🎯 Next Steps

Your keys are ready! Now you can:

```bash
# Test voiceover generation
python voiceover_generator.py "Hello world!"

# Generate complete video
python generate_video.py "Your script"

# Interactive mode
python main.py
```

All scripts will automatically use your API keys from `api_keys.txt`!

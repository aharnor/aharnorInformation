
Navigate to your backend directory
cd /home/andrew/github/aharnorInformation/backend
# make sure  KRATER_API_KEY is set 


Create a virtual environment using uv (creates a .venv folder)
uv venv

Activate the virtual environment
source .venv/bin/activate

Install your requirements using uv's fast pip implementation
uv pip install -r requirements.txt

Run your FastAPI backend server
uvicorn server:app --reload --port 8000

Check if front and or backend is running locally 
egrep '[38]000' <(ss -tulnp)

##############################################################################
# Local Python Backend Setup & Cleanup Guide
## 1. Add to `.gitignore`
# Python virtual environment
backend/venv/
venv/

# Python cache files
**/__pycache__/
*.py[cod]
*$py.class

# Local environment files
.env
.env.local
.env.*.local

## 2. Bash Commands to Clear Everything Away (Reset)
Run these commands in your Linux terminal to completely wipe out your local virtual environment and Python cache files:

# 1. Deactivate the virtual environment if it is currently active
deactivate 2>/dev/null || true

( cd /home/andrew/github/aharnorInformation/backend ; rm -rf .venv ; find . -type d -name "__pycache__" -exec rm -rf {} + )

# 5. Clear the exported Krater API key from your current shell session
unset KRATER_API_KEY

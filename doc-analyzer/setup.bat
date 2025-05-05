@echo off
echo Setting up DocAnalyzer...

REM Check for required tools
echo Checking for required tools...
where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Node.js is not installed. Please install Node.js 18+ and try again.
    exit /b 1
)

where python >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo Python is not installed. Please install Python 3.9+ and try again.
    exit /b 1
)

REM Create and activate Python virtual environment
echo Setting up Python virtual environment...
cd backend
python -m venv venv
call venv\Scripts\activate

REM Install Python dependencies
echo Installing Python dependencies...
pip install -r requirements.txt

REM Set up environment variables
echo Setting up environment variables...
copy .env.example .env
echo Please edit backend\.env and add your OpenAI API key

REM Install Node.js dependencies
echo Installing Node.js dependencies...
cd ..\frontend
call npm install

REM Set up frontend environment variables
copy .env.example .env

echo Setup complete!
echo To start the application:
echo 1. Add your OpenAI API key to backend\.env
echo 2. Run 'npm start' from the root directory
echo 3. Open http://localhost:3000 in your browser 
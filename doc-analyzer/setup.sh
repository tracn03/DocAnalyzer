#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Setting up DocAnalyzer...${NC}"

# Check for required tools
echo -e "${YELLOW}Checking for required tools...${NC}"
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Please install Node.js 18+ and try again."
    exit 1
fi

if ! command -v python3 &> /dev/null; then
    echo "Python 3 is not installed. Please install Python 3.9+ and try again."
    exit 1
fi

# Create and activate Python virtual environment
echo -e "${YELLOW}Setting up Python virtual environment...${NC}"
cd backend
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install Python dependencies
echo -e "${YELLOW}Installing Python dependencies...${NC}"
pip install -r requirements.txt

# Set up environment variables
echo -e "${YELLOW}Setting up environment variables...${NC}"
cp .env.example .env
echo -e "${GREEN}Please edit backend/.env and add your OpenAI API key${NC}"

# Install Node.js dependencies
echo -e "${YELLOW}Installing Node.js dependencies...${NC}"
cd ../frontend
npm install

# Set up frontend environment variables
cp .env.example .env

echo -e "${GREEN}Setup complete!${NC}"
echo -e "${YELLOW}To start the application:${NC}"
echo "1. Add your OpenAI API key to backend/.env"
echo "2. Run 'npm start' from the root directory"
echo "3. Open http://localhost:3000 in your browser" 
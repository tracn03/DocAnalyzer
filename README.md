# DocAnalyzer - AI-Powered Teaching Assistant

DocAnalyzer is an intelligent document analysis platform designed specifically for teachers. It helps educators create teaching materials, provide feedback, and grade assignments using advanced AI capabilities.

## Features

- 📝 Document Analysis: Upload and analyze teaching materials
- ✍️ Material Generation: Create customized teaching materials
- 📊 Automated Grading: AI-powered grading system
- 💬 Feedback Generation: Generate detailed feedback for students
- 🎯 Customizable Prompts: Tailor AI responses to your specific needs

## Tech Stack

- Frontend: Next.js 14 with TypeScript
- Backend: Python FastAPI
- AI: OpenAI API
- Database: PostgreSQL
- Authentication: NextAuth.js

## Project Structure

```
doc-analyzer/
├── frontend/          # Next.js frontend application
├── backend/           # Python FastAPI backend
└── shared/            # Shared types and utilities
```

## Getting Started

### Prerequisites

- Node.js 18+
- Python 3.9+
- PostgreSQL
- OpenAI API key

### Installation

1. Clone the repository
2. Install frontend dependencies:
   ```bash
   cd frontend
   npm install
   ```
3. Install backend dependencies:
   ```bash
   cd backend
   pip install -r requirements.txt
   ```
4. Set up environment variables:
   - Copy `.env.example` to `.env` in both frontend and backend directories
   - Add your OpenAI API key and other configuration

### Running the Application

1. Start the backend:
   ```bash
   cd backend
   uvicorn main:app --reload
   ```

2. Start the frontend:
   ```bash
   cd frontend
   npm run dev
   ```

3. Open [http://localhost:3000](http://localhost:3000) in your browser

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
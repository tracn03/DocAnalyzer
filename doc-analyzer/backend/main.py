from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import openai
import os
from dotenv import load_dotenv
import json

# Load environment variables
load_dotenv()

# Initialize OpenAI client
openai.api_key = os.getenv("OPENAI_API_KEY")

app = FastAPI()

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allow all origins during development
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "DocAnalyzer API is running"}

class DocumentRequest(BaseModel):
    content: str
    task_type: str  # "material", "feedback", or "grade"

@app.post("/analyze")
async def analyze_document(request: DocumentRequest):
    try:
        # Define the system message based on task type
        system_messages = {
            "material": "You are a helpful teaching assistant. Create educational materials based on the provided content. If the content is about algebra, create a set of algebra problems with solutions.",
            "feedback": "You are a helpful teaching assistant. Provide constructive feedback on the student's work.",
            "grade": "You are a helpful teaching assistant. Grade the student's work and provide a detailed assessment."
        }

        # Get the appropriate system message
        system_message = system_messages.get(request.task_type)
        if not system_message:
            raise HTTPException(status_code=400, detail="Invalid task type")

        # Call OpenAI API
        response = openai.ChatCompletion.create(
            model="gpt-4",
            messages=[
                {"role": "system", "content": system_message},
                {"role": "user", "content": request.content}
            ],
            temperature=0.7,
            max_tokens=1000
        )

        return {"result": response.choices[0].message.content}

    except Exception as e:
        print(f"Error in analyze_document: {str(e)}")  # Add logging
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/upload")
async def upload_file(file: UploadFile = File(...)):
    try:
        content = await file.read()
        content_str = content.decode("utf-8")
        
        return {"content": content_str}
    except Exception as e:
        print(f"Error in upload_file: {str(e)}")  # Add logging
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000) 
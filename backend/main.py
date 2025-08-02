from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

app = FastAPI()

# CORS config so frontend can talk to backend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/ping")
def ping():
    return {"message": "pong"}

class Message(BaseModel):
    name: str
    message: str

@app.post("/echo")
def echo(data: Message):
    return {"reply": f"Hello {data.name}, you said: {data.message}"}

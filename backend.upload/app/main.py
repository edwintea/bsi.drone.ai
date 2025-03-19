from fastapi import FastAPI, File, UploadFile, HTTPException, Form
from fastapi.responses import JSONResponse, HTMLResponse
from fastapi import Request
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from azure_blob import AzureBlobStorage
from fastapi.middleware.cors import CORSMiddleware
import os

app = FastAPI()

# CORS configuration

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allow all origins (or specify your frontend origin)
    allow_credentials=True,
    allow_methods=["*"],  # Allow all HTTP methods
    allow_headers=["*"],  # Allow all headers
)

# Azure Blob Storage configuration
AZURE_CONNECTION_STRING = "DefaultEndpointsProtocol=https;AccountName=rndstorage2;AccountKey=99JL4roWL4FtwmZLXeu3jVzxs1Ckh0BVrL4SiTW4FAKc7PPaLekLXt1bgLiibORDdx0MKg7MRxTU+AStq4ULXw==;EndpointSuffix=core.windows.net"
CONTAINER_NAME = "imagedetection"

# Initialize Azure Blob Storage
blob_storage = AzureBlobStorage(AZURE_CONNECTION_STRING, CONTAINER_NAME)

UPLOAD_DIRECTORY = "../uploads"

# Create the upload directory if it doesn't exist
if not os.path.exists(UPLOAD_DIRECTORY):
    os.makedirs(UPLOAD_DIRECTORY)

app.mount("/static", StaticFiles(directory="../static"), name="static")
app.mount("/uploads", StaticFiles(directory="../uploads"), name="upload")
app.mount("/templates", StaticFiles(directory="../templates"), name="template")

templates = Jinja2Templates(directory="../templates")

# CORS configuration
origins = [
    "http://127.0.0.1:8011"  # No trailing slash
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,  # Allows specific origins
    allow_credentials=True,
    allow_methods=["*"],  # Allows all methods (GET, POST, etc.)
    allow_headers=["*"],  # Allows all headers
)

@app.get("/", response_class=HTMLResponse)
async def read_index(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})

@app.post("/upload/")
async def upload( # upload file with chunk
        file: UploadFile = File(...),
        chunkIndex: int = Form(...),
        totalChunks: int = Form(...),
        originalFilename: str = Form(...)
):
    # Log the upload attempt
    print(f"Uploading chunk {chunkIndex + 1}/{totalChunks} for {originalFilename}")

    # Upload the file chunk to Azure Blob Storage
    try:
        file_content = await file.read()  # Read the file content asynchronously
        await blob_storage.upload_blob(file_content, originalFilename)  # Pass the content
        print(f"Uploaded chunk: {originalFilename}")

        # Generate the URL for the uploaded blob
        blob_url = await blob_storage.get_blob_url(originalFilename)  # Await the get_blob_url method
        print(f"blob url: {blob_url}")
        return {
            "chunkIndex": chunkIndex,
            "totalChunks": totalChunks,
            "filename": originalFilename,
            "url": blob_url  # Return the URL of the uploaded blob
        }
    except Exception as e:
        print(f"Failed to upload chunk to Azure: {e}")
        # Fallback to local storage
        local_file_path = os.path.join(UPLOAD_DIRECTORY, originalFilename)
        with open(local_file_path, "ab") as buffer:  # Append mode
            buffer.write(file_content)  # Use the already read content
        print(f"Saved chunk locally: {local_file_path}")
        raise HTTPException(status_code=500, detail="Failed to upload chunk to Azure, saved locally.")

@app.get("/files", response_class=JSONResponse)
async def list_files():
    # List blobs in the container
    files = await blob_storage.list_blobs()
    return {"files": files}

@app.get("/files/{filename}", response_class=JSONResponse)
async def get_file(filename: str):
    # Generate a URL for the blob
    url = await blob_storage.get_blob_url(filename)
    if url:
        return JSONResponse(content={"url": url})
    else:
        raise HTTPException(status_code=404, detail="File not found")
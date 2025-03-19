from dotenv import load_dotenv
import os

# Load environment variables from the .env file
load_dotenv()

ABS_CONNECTION_STRING = os.getenv("ABS_CONNECTION_STRING")
ABS_CONTAINER_NAME = os.getenv("ABS_CONTAINER_NAME")

if not ABS_CONNECTION_STRING:
    raise ValueError("No Azure Connection String found in environment variables")

if not ABS_CONTAINER_NAME:
    raise ValueError("No Container found in environment variables")
from dotenv import load_dotenv
import os

# Load environment variables from the .env file
load_dotenv()

RABBITMQ_URL = os.getenv("RABBITMQ_URL")

if not RABBITMQ_URL:
    raise ValueError("No RABBITMQ_URL found in environment variables")
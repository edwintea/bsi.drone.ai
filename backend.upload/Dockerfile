# Use an official Python image as the base
FROM python:3.10-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Set environment variables
ENV APP_NAME="EDA Project - Upload"
ENV DEBUG_MODE=True

# Run the command to start the application
CMD ["python", "app/main.py"]
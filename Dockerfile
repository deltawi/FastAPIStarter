# Stage 1: Build the base image with dependencies
FROM python:3.10-slim-buster as base

# Install system dependencies
RUN apt-get update && \
    apt-get install -y curl libgl1-mesa-glx libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy and install Python dependencies
# Note: Only copy the requirements.txt initially to leverage Docker cache if requirements.txt doesn't change
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Build the project-specific image using the base image
FROM base as final

# Copy the project files into the container
COPY . /app

# Make port 8071 available to the world outside this container
EXPOSE 8071

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8071"]

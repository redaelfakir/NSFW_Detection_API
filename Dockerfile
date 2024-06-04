
# Use the official Python slim base image for the build stage
FROM python:3.9-slim as builder

# Set the working directory
WORKDIR /app

# Copy only the requirements file first to leverage Docker cache
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -U pip && pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Use the official Python slim base image for the final stage
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the installed dependencies from the builder stage
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

# Copy the application files from the builder stage
COPY --from=builder /app /app

# Define the command to run the application
CMD ["python", "-m", "api.__main__"]

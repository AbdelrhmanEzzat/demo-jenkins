# Use official Python image (lightweight)
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app


# Copy the rest of your app files
COPY . .

# Command to run your app (change app.py to your main script)
CMD ["python", "app.py"]

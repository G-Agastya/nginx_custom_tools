# Stage 1: Build an image with the necessary dependencies
FROM python:3.8 as builder

# Install OpenCV-Python and NumPy
RUN pip install opencv-python numpy

# Stage 2: Create a lightweight image for running the script
FROM python:3.8-slim

# Copy installed packages from the builder stage
COPY --from=builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages

# Set the working directory
WORKDIR /facial_recognition





# Run the Python script
CMD ["python", "code_to_run.py"]

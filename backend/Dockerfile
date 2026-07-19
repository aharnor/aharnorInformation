FROM python:3.11-slim

# Install system dependencies for OCR and PDF conversion
RUN apt-get update && apt-get install -y \
    poppler-utils \
    tesseract-ocr \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#  Or with uv/pyproject.toml
# COPY pyproject.toml uv.lock ./
# RUN pip install --no-cache-dir uv && uv pip install --system -r pyproject.toml

# Copy the rest of the application files
COPY . .

# Expose port 8000 (Render will automatically detect this or let us map it)
EXPOSE 8000

# Run Uvicorn
##CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]

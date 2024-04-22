FROM python:3.8-slim

WORKDIR /usr/src/app

# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt

COPY app_memory.py /usr/src/app

# Run app.py when the container launches
CMD ["python", "app_memory.py"]
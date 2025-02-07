FROM python:3.9-slim

# ติดตั้ง FFmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# สร้างและตั้งค่าโฟลเดอร์ทำงาน
WORKDIR /app

# คัดลอกไฟล์โปรเจค
COPY requirements.txt .
COPY bot.py .
COPY .env .

# ติดตั้ง dependencies
RUN pip install --no-cache-dir -r requirements.txt

# รันบอท
CMD ["python", "bot.py"]
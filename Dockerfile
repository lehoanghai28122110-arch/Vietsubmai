FROM python:3.12-slim

# ffmpeg can cho "Xuat MP4 tren may chu" va "Nghe video nhanh" (Groq)
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY vietsubminecratf.py .

ENV PYTHONUNBUFFERED=1 \
    VSMC_TRUST_PROXY=1

# Render tu dat bien PORT; script doc PORT va lang nghe 0.0.0.0
CMD ["python", "vietsubminecratf.py", "--force-https"]

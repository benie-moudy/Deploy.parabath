FROM node:20-bullseye-slim

RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libwebp \
    python3 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Clone le repo
RUN git clone https://github.com/prabathLK/prabath-multi-device.git /app

WORKDIR /app

RUN npm install

CMD ["node", "."]

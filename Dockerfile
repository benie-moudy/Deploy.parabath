FROM node:20-bullseye-slim

RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    python3 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/prabathLK/prabath-multi-device.git /app

WORKDIR /app

RUN npm install

# Crée le dossier lib et écrase bard.js pour désactiver Bard
RUN mkdir -p /app/lib && \
    echo "module.exports = async () => { return '🧠 Bard désactivé dans cette version du bot.'; };" > /app/lib/bard.js

CMD ["node", "."]

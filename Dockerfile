FROM node:20-bullseye-slim

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    python3 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Cloner le repo original
RUN git clone https://github.com/prabathLK/prabath-multi-device.git /app

WORKDIR /app

# Installer les dépendances Node.js
RUN npm install

# Écraser bard.js pour désactiver Bard proprement
RUN echo "module.exports = async () => { return '🧠 Bard désactivé dans cette version du bot.'; };" > /app/lib/bard.js

# Lancer le bot
CMD ["node", "start.js"]

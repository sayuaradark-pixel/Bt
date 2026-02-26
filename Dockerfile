FROM node:20-alpine

WORKDIR /app

# 🔥 Install git (Fix for npm git error)
RUN apk add --no-cache git

COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

COPY . .

ENV NODE_ENV=production

EXPOSE 8000

CMD ["node", "index.js"]

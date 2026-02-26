# Use lightweight Node image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install required system packages
RUN apk add --no-cache git

# Copy package files first (for better caching)
COPY package*.json ./

# Install dependencies (Force clean install)
RUN npm install --force --legacy-peer-deps

# Copy rest of the project
COPY . .

# Environment
ENV NODE_ENV=production

# Expose port (Change if your app uses different port)
EXPOSE 8000

# Start application
CMD ["node", "index.js"]

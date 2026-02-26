# Use lightweight Node image
FROM node:20-alpine

# Create app directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install only production dependencies
RUN npm install --omit=dev

# Copy all project files
COPY . .

# Set environment
ENV NODE_ENV=production

# Expose Express port (change if needed)
EXPOSE 3000

# Start application
CMD ["node", "index.js"]

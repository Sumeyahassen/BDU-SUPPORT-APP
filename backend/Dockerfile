# --- Stage 1: Base Node.js ---
  FROM node:18-alpine AS base
  WORKDIR /app
  
  # --- Stage 2: Install dependencies ---
  FROM base AS deps
  COPY package.json package-lock.json ./
  RUN npm ci --only=production
  
  # --- Stage 3: Runner with MongoDB ---
  FROM base AS runner
  ENV NODE_ENV=production
  WORKDIR /app
  
  # Copy node_modules from deps stage
  COPY --from=deps /app/node_modules ./node_modules
  
  # Copy app source code
  COPY . .
  
  # Create uploads and MongoDB data directories
  RUN mkdir -p /app/uploads /data/db
  
  # Install MongoDB inside the container
  RUN apk add --no-cache mongodb
  
  # Expose backend port
  EXPOSE 5000
  # Expose MongoDB port (optional for testing)
  EXPOSE 27017
  
  # Healthcheck for backend
  HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
    CMD wget -qO- http://localhost:5000/ || exit 1
  
  # Start MongoDB in background, then Node.js server
  CMD mongod --dbpath /data/db --bind_ip 127.0.0.1 & node server.js
  
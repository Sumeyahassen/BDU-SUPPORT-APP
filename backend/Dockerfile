# --- Stage 1: Base Node.js ---
FROM node:18-alpine AS base
WORKDIR /app

# --- Stage 2: Install dependencies ---
FROM base AS deps
COPY package.json package-lock.json ./
RUN npm ci --only=production

# --- Stage 3: Runner ---
FROM base AS runner
ENV NODE_ENV=production
WORKDIR /app

# Copy node_modules from deps stage
COPY --from=deps /app/node_modules ./node_modules

# Copy app source code
COPY . .

# Ensure uploads directory exists for static files
RUN mkdir -p /app/uploads

# Expose backend port
EXPOSE 5000

# Healthcheck for backend
HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
  CMD wget -qO- http://localhost:5000/ || exit 1

# Start Node.js server
CMD ["node", "server.js"]

#!/bin/bash

echo "🔄 Switching to Local MongoDB..."
echo ""

# Backup current .env if exists
if [ -f .env ]; then
    cp .env .env.backup
    echo "✅ Backed up .env to .env.backup"
fi

# Create new .env for local MongoDB
cat > .env << 'EOF'
# Using Local MongoDB (Docker)
MONGO_URI=mongodb://mongo:27017/bdu_support_app

# Environment
NODE_ENV=development

# Port
PORT=5000
EOF

echo "✅ Created .env with local MongoDB configuration"
echo ""
echo "📋 What to do next:"
echo "1. Make sure Docker is running: docker ps"
echo "2. Start MongoDB: docker-compose up mongo -d"
echo "3. Test connection: node seed.js"
echo ""







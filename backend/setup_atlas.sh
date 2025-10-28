#!/bin/bash

echo "🚀 MongoDB Atlas Setup Helper"
echo "============================"
echo ""

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Creating .env file..."
    cat > .env << 'EOF'
# MongoDB Atlas Connection
# Get your connection string from: https://cloud.mongodb.com/
MONGO_URI=mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/bdu_support_app?retryWrites=true&w=majority

# Environment
NODE_ENV=production

# Port
PORT=5000
EOF
    echo "✅ Created .env file"
    echo ""
else
    echo "⚠️  .env file already exists"
    echo ""
fi

echo "📋 Next Steps:"
echo "1. Go to https://cloud.mongodb.com/ and create an account"
echo "2. Create a free cluster"
echo "3. Create a database user (Database Access)"
echo "4. Add your IP to Network Access (0.0.0.0/0 for all)"
echo "5. Get your connection string from 'Connect' > 'Connect your application'"
echo ""
echo "6. Edit backend/.env and update MONGO_URI with your connection string"
echo ""
echo "7. Run: node seed.js to test the connection"
echo ""







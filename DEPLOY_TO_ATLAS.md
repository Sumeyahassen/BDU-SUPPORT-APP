# How to Deploy with MongoDB Atlas

## Current Situation
✅ Local development works with local MongoDB  
❌ Deployment needs MongoDB Atlas  

## Step-by-Step: Connect Deployment to Atlas

### Step 1: Setup MongoDB Atlas (If not done)

1. Go to: https://cloud.mongodb.com/
2. Create account → Free cluster
3. Create database user (Database Access)
4. Whitelist IP: Network Access → Add IP → "Allow Access from Anywhere" (0.0.0.0/0)
5. Get connection string: Connect → Connect your application → Copy string

### Step 2: Get Your Connection String

From MongoDB Atlas, your connection string looks like:
```
mongodb+srv://your_username:your_password@cluster0.abc123.mongodb.net/bdu_support_app?retryWrites=true&w=majority
```

**Replace:**
- `your_username` - Your Atlas database username
- `your_password` - Your Atlas database password  
- `cluster0.abc123.mongodb.net` - Your cluster URL

### Step 3: Deploy Based on Your Platform

#### If using Heroku:

```bash
# Set environment variables
heroku config:set MONGO_URI="mongodb+srv://username:password@cluster.net/bdu_support_app"
heroku config:set NODE_ENV=production

# Deploy
git add .
git commit -m "Deploy with Atlas"
git push heroku main

# Seed database
heroku run node backend/seed.js
```

#### If using Railway:

1. Go to Railway dashboard
2. Click "Variables" 
3. Add:
   ```
   MONGO_URI=mongodb+srv://username:password@cluster.net/bdu_support_app
   NODE_ENV=production
   ```
4. Railway auto-deploys from GitHub

#### If using Render:

1. Go to Render dashboard
2. Create Web Service → Connect GitHub
3. Environment Variables tab → Add:
   ```
   MONGO_URI=mongodb+srv://username:password@cluster.net/bdu_support_app
   NODE_ENV=production
   ```
4. Deploy

#### If using Docker:

```bash
# Create production .env
cat > backend/.env << EOF
MONGO_URI=mongodb+srv://username:password@cluster.net/bdu_support_app
NODE_ENV=production
PORT=5000
EOF

# Build and deploy
docker-compose build
docker-compose up -d
docker-compose exec backend node seed.js
```

---

## Keep Local Development Working

**For local development, keep using local MongoDB:**

```bash
# Local .env
cd backend
cat > .env << EOF
MONGO_URI=mongodb://localhost:27017/bdu_support_app
NODE_ENV=development
PORT=5000
EOF

# Start local MongoDB
docker run -d -p 27017:27017 --name mongodb mongo:latest

# Test
node seed.js
```

---

## Summary

| What | Local | Deployment |
|------|-------|------------|
| MongoDB | Local MongoDB | MongoDB Atlas |
| Connection | `mongodb://localhost:27017/...` | `mongodb+srv://username:password@cluster.net/...` |
| Where | `.env` file | Platform environment variables |
| Test | `node seed.js` | `curl https://your-app.com/api/courses` |

---

## Quick Commands

### Test Local (Working now):
```bash
# Local MongoDB
docker run -d -p 27017:27017 --name mongodb mongo:latest

# Set local env
cd backend
cat > .env << EOF
MONGO_URI=mongodb://localhost:27017/bdu_support_app
NODE_ENV=development
EOF

# Run
node seed.js
```

### Deploy to Production:
```bash
# Set Atlas connection in deployment platform
MONGO_URI=mongodb+srv://username:password@cluster.net/bdu_support_app
NODE_ENV=production

# Deploy (depends on platform)
```

---

## Most Important

1. ✅ **Local**: Keep using `mongodb://localhost:27017/bdu_support_app`
2. ✅ **Production**: Use `mongodb+srv://...` from Atlas
3. ✅ **Whitelist IPs**: Add 0.0.0.0/0 to Atlas Network Access
4. ✅ **Set Environment Variables**: Use your deployment platform's settings

That's it! Your local works, deployment will work with Atlas! 🚀







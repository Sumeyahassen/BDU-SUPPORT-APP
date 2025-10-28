# Deployment Guide: Connect to MongoDB Atlas

## Current Situation ✅
- **Local Development**: Works with local MongoDB ✅
- **Deployment**: Need to connect to MongoDB Atlas ❌

## Quick Setup: Local vs Production

### Local Development (Keep as is)
Uses: `mongodb://localhost:27017/bdu_support_app`

### Production/Deployment
Uses: `mongodb+srv://username:password@cluster.net/bdu_support_app`

---

## Setup for Different Environments

### Option 1: Use Environment Variables

**Local (.env file):**
```env
MONGO_URI=mongodb://localhost:27017/bdu_support_app
NODE_ENV=development
PORT=5000
```

**Production (Deployment Platform):**
Set these environment variables:
```
MONGO_URI=mongodb+srv://username:password@cluster.net/bdu_support_app
NODE_ENV=production
PORT=5000
```

### Option 2: Update Code to Auto-Detect

Update `backend/config/db.js`:

```javascript
const mongoose = require("mongoose");

const connectDB = async () => {
  try {
    // Use Atlas in production, local in development
    const mongoURI = process.env.MONGO_URI || 
      (process.env.NODE_ENV === 'production' 
        ? 'mongodb+srv://your-atlas-uri'
        : 'mongodb://localhost:27017/bdu_support_app');
    
    const conn = await mongoose.connect(mongoURI);
    console.log(`✅ MongoDB Connected: ${conn.connection.host}`);
  } catch (err) {
    console.error(`❌ Error: ${err.message}`);
    process.exit(1);
  }
};

module.exports = connectDB;
```

---

## Deploy to Different Platforms

### Deployment Option A: Heroku

**Steps:**

1. **Set environment variables in Heroku:**
```bash
heroku config:set MONGO_URI="mongodb+srv://username:password@cluster.net/bdu_support_app"
heroku config:set NODE_ENV=production
heroku config:set PORT=5000
```

2. **Deploy:**
```bash
git push heroku main
```

3. **Seed database:**
```bash
heroku run node backend/seed.js
```

---

### Deployment Option B: Railway

**Steps:**

1. Go to Railway dashboard
2. Click "Variables" tab
3. Add these variables:
   - `MONGO_URI` = `mongodb+srv://username:password@cluster.net/bdu_support_app`
   - `NODE_ENV` = `production`
   - `PORT` = `5000`
4. Deploy automatically via GitHub

---

### Deployment Option C: Render

**Steps:**

1. Go to Render dashboard
2. Create new Web Service
3. Add Environment Variables:
   - `MONGO_URI` = `mongodb+srv://...`
   - `NODE_ENV` = `production`
4. Set Build Command: `cd backend && npm install`
5. Set Start Command: `cd backend && node server.js`

---

### Deployment Option D: DigitalOcean App Platform

**Steps:**

1. Create new App from GitHub
2. Add Environment Variables:
   ```
   MONGO_URI=mongodb+srv://...
   NODE_ENV=production
   PORT=5000
   ```
3. Deploy

---

## Important: Before Deployment

### 1. Update MongoDB Atlas Whitelist

Go to https://cloud.mongodb.com/:

1. Click "Network Access"
2. Click "Add IP Address"
3. Add your deployment platform's IP ranges:
   - **Heroku**: No IP needed (uses 0.0.0.0/0 automatically)
   - **Railway**: Add `0.0.0.0/0` (allow all)
   - **Render**: Add `0.0.0.0/0` (allow all)
4. OR for development: Click "Allow Access from Anywhere"

### 2. Get Your Atlas Connection String

1. Go to https://cloud.mongodb.com/
2. Click "Connect" on your cluster
3. Choose "Connect your application"
4. Copy the connection string
5. Replace `<username>` and `<password>` with your database user

Format:
```
mongodb+srv://username:password@cluster.net/bdu_support_app?retryWrites=true&w=majority
```

---

## Testing After Deployment

```bash
# Test connection from local machine
curl https://your-app.herokuapp.com/api/courses

# Should return:
[{"_id":"...","name":"...","code":"..."}]
```

---

## Complete Workflow

### Development (Local - MongoDB):
```bash
# Start local MongoDB
docker run -d -p 27017:27017 --name mongodb mongo:latest

# Set local environment
cd backend
cat > .env << EOF
MONGO_URI=mongodb://localhost:27017/bdu_support_app
NODE_ENV=development
PORT=5000
EOF

# Run
node seed.js
node server.js
```

### Production (Deployment - Atlas):
```bash
# Set production environment variables in your platform:
MONGO_URI=mongodb+srv://username:password@cluster.net/bdu_support_app
NODE_ENV=production
PORT=5000

# Platform handles deployment automatically
```

---

## Quick Summary

| Environment | MongoDB | Connection String |
|------------|---------|-------------------|
| **Local** | Local MongoDB | `mongodb://localhost:27017/bdu_support_app` |
| **Production** | MongoDB Atlas | `mongodb+srv://username:password@cluster.net/bdu_support_app` |

**For Deployment:**
1. Get MongoDB Atlas connection string ✅
2. Whitelist IP addresses in Atlas ✅
3. Set environment variables in your platform ✅
4. Deploy ✅

## Next Steps

1. ✅ Whitelist IP in MongoDB Atlas for deployment
2. ✅ Get your Atlas connection string
3. ✅ Set environment variables on your deployment platform
4. ✅ Deploy your application
5. ✅ Test the connection








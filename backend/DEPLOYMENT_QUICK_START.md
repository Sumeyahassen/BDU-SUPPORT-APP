# Quick Start: Deploy with MongoDB Atlas

## Problem ✅ SOLVED
You cannot deploy because you're trying to use local MongoDB. This guide shows how to use **MongoDB Atlas** (cloud) for deployment.

## 3-Minute Setup

### Step 1: Get MongoDB Atlas Connection String (2 minutes)

1. **Sign up**: Go to https://www.mongodb.com/cloud/atlas
2. **Create cluster**: Choose FREE tier, select any cloud provider
3. **Create database user**: 
   - Database Access → Add New Database User
   - Username: `admin` (or your choice)
   - Password: `SecurePass123` (or your choice)
   - Click "Add User"
4. **Allow network access**:
   - Network Access → Add IP Address
   - Click "Allow Access from Anywhere" (for development)
5. **Get connection string**:
   - Click "Connect" on your cluster
   - Choose "Connect your application"
   - Copy the connection string
   
   It looks like:
   ```
   mongodb+srv://admin:SecurePass123@cluster0.abc123.mongodb.net/?retryWrites=true&w=majority
   ```

### Step 2: Update Your Configuration (30 seconds)

**Option A: Using .env file (Recommended)**

Create `backend/.env`:

```bash
MONGO_URI=mongodb+srv://admin:SecurePass123@cluster0.abc123.mongodb.net/bdu_support_app?retryWrites=true&w=majority
NODE_ENV=production
PORT=5000
```

**Replace with your actual values from Step 1!**

**Option B: Update docker-compose.yml**

Edit `docker-compose.yml` line 24:

```yaml
# Change from:
- MONGO_URI=mongodb://mongo:27017/bdu_support_app

# To:
- MONGO_URI=mongodb+srv://admin:SecurePass123@cluster0.abc123.mongodb.net/bdu_support_app?retryWrites=true&w=majority
```

Also comment out the `mongo` service and `depends_on` if using Atlas only.

### Step 3: Test Connection (30 seconds)

```bash
cd backend

# Test connection
node seed.js
```

You should see:
```
✅ MongoDB Connected: cluster0-shard-00-00.abc123.mongodb.net
✅ Seed completed: departments and courses inserted.
```

## For Different Deployment Platforms

### Docker Compose

```bash
# Update .env with Atlas connection string
# Then run:
docker-compose up -d
docker-compose up seed  # Run once to seed data
```

### Heroku

```bash
heroku config:set MONGO_URI="your-connection-string"
git push heroku main
```

### Railway

1. Go to your project
2. Add Environment Variable: `MONGO_URI=your-connection-string`
3. Deploy

### Render

1. Go to your service
2. Add Environment Variable: `MONGO_URI=your-connection-string`
3. Deploy

## Common Issues & Fixes

### ❌ Error: "Authentication failed"
**Fix**: 
- Check username and password in connection string
- Make sure you created the database user

### ❌ Error: "Connection timeout"
**Fix**:
- Add your server IP to Network Access in Atlas
- Or use "Allow Access from Anywhere" (0.0.0.0/0)

### ❌ Error: "cannot connect"
**Fix**:
- Make sure your connection string is correct
- Format: `mongodb+srv://username:password@cluster.net/dbname`

## Quick Reference

### Local MongoDB (Development)
```bash
MONGO_URI=mongodb://localhost:27017/bdu_support_app
```

### MongoDB Atlas (Production/Deployment)
```bash
MONGO_URI=mongodb+srv://username:password@cluster.net/bdu_support_app
```

## Next Steps

1. ✅ Get MongoDB Atlas connection string
2. ✅ Update `.env` or `docker-compose.yml`
3. ✅ Test connection with `node seed.js`
4. ✅ Deploy your application
5. ✅ Seed your data with `node seed_resources.js`

## Need More Help?

See detailed guide: `backend/MONGODB_ATLAS_SETUP.md`

## Current Status

✅ Files updated:
- `docker-compose.yml` - Ready for Atlas
- `backend/MONGODB_ATLAS_SETUP.md` - Detailed guide
- `backend/setup_atlas.sh` - Setup helper
- `backend/.gitignore` - Prevents committing secrets

📝 What you need to do:
1. Get MongoDB Atlas connection string
2. Update connection string in `.env` or `docker-compose.yml`
3. Test and deploy!


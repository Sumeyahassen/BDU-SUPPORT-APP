# MongoDB Atlas Deployment Setup

## Problem
Your application is currently configured for local MongoDB. To deploy with MongoDB Atlas (cloud), you need to update the connection string.

## Step-by-Step Setup

### Step 1: Create MongoDB Atlas Account
1. Go to https://www.mongodb.com/cloud/atlas
2. Sign up for a free account
3. Create a new cluster (choose FREE tier)

### Step 2: Get Your Connection String

1. In MongoDB Atlas, click **"Connect"** on your cluster
2. Choose **"Connect your application"**
3. Copy the connection string (looks like this):
   ```
   mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority
   ```

### Step 3: Configure Database Access

1. Go to **Database Access** in MongoDB Atlas
2. Click **"Add New Database User"**
3. Create a username and password
4. Set role to **"Atlas admin"** or **"Read and write to any database"**
5. Click **"Add User"**

Replace `<username>` and `<password>` in your connection string.

### Step 4: Configure Network Access

1. Go to **Network Access** in MongoDB Atlas
2. Click **"Add IP Address"**
3. Click **"Allow Access from Anywhere"** (for development)
   - Or add your specific server IPs
4. Click **"Add"**

### Step 5: Create .env File

Create `backend/.env` file:

```bash
# MongoDB Atlas Connection
MONGO_URI=mongodb+srv://yourusername:yourpassword@cluster0.xxxxx.mongodb.net/bdu_support_app?retryWrites=true&w=majority

# Environment
NODE_ENV=production

# Port
PORT=5000
```

**Replace:**
- `yourusername` - Your MongoDB Atlas username
- `yourpassword` - Your MongoDB Atlas password
- `cluster0.xxxxx.mongodb.net` - Your cluster URL
- `bdu_support_app` - Your database name (can change this)

### Step 6: Update docker-compose.yml

Update your `docker-compose.yml` to use environment variables:

```yaml
version: "3.9"

services:
  backend:
    build:
      context: ./backend
      dockerfile: Dockerfile
    container_name: bdu_backend
    environment:
      - MONGO_URI=${MONGO_URI}
      - NODE_ENV=production
      - PORT=5000
    ports:
      - "5000:5000"
    restart: unless-stopped
    env_file:
      - ./backend/.env

  seed:
    build:
      context: ./backend
      dockerfile: Dockerfile
    container_name: bdu_seed
    environment:
      - MONGO_URI=${MONGO_URI}
      - NODE_ENV=production
    command: ["node", "seed.js"]
    restart: "no"
    env_file:
      - ./backend/.env
```

### Step 7: Remove Local MongoDB

Since you're using Atlas, you don't need the local MongoDB container:

```yaml
# Remove this section:
# mongo:
#   image: mongo:6
#   ...
```

### Step 8: Deploy

```bash
# Build and start services
docker-compose up -d

# Run migrations/seeds
docker-compose up seed
```

## Alternative: Deploy Without Docker

If deploying to a cloud service (Heroku, Railway, Render, etc.):

### 1. Set Environment Variables

In your hosting platform, set:
```
MONGO_URI=mongodb+srv://username:password@cluster.xxxxx.mongodb.net/bdu_support_app
NODE_ENV=production
PORT=5000
```

### 2. Deploy

```bash
# For Heroku
heroku config:set MONGO_URI="your-connection-string"

# For Railway
# Add in Railway dashboard > Variables

# For Render
# Add in Render dashboard > Environment
```

## Testing Connection

After setup, test your connection:

```bash
cd backend
node seed.js
```

You should see:
```
✅ MongoDB Connected: Cluster0-shard-0-shard-00-00.xxxxx.mongodb.net
✅ Seed completed: departments and courses inserted.
```

## Troubleshooting

### Error: "Authentication failed"
- **Fix**: Check your username and password in the connection string
- Make sure database user has correct permissions

### Error: "Connection timeout"
- **Fix**: Add your IP address to Network Access whitelist in MongoDB Atlas
- Or allow all IPs (0.0.0.0/0) for development

### Error: "certificate verify failed"
- **Fix**: Use the correct connection string format
- Make sure it starts with `mongodb+srv://`

### Error: "Database not found"
- **Fix**: The database will be created automatically when you first connect
- Or create it manually in MongoDB Atlas

## Current Configuration

### Local MongoDB (Current - Not working for deployment)
```yaml
MONGO_URI=mongodb://mongo:27017/bdu_support_app
```

### MongoDB Atlas (For deployment)
```yaml
MONGO_URI=mongodb+srv://username:password@cluster.xxxxx.mongodb.net/bdu_support_app
```

## Security Notes

⚠️ **Important:**
- Never commit your `.env` file to Git
- Keep your password secure
- Use IP whitelisting in production
- Rotate passwords regularly

## Complete Example

After setup, your `.env` should look like:

```env
MONGO_URI=mongodb+srv://admin:SecurePass123@cluster0.abc123.mongodb.net/bdu_support_app?retryWrites=true&w=majority
NODE_ENV=production
PORT=5000
```

## Next Steps

1. Create MongoDB Atlas account
2. Get connection string
3. Create `.env` file with Atlas connection
4. Update `docker-compose.yml`
5. Run `docker-compose up -d`
6. Test connection with `node seed.js`

## Need Help?

- MongoDB Atlas Docs: https://docs.mongodb.com/atlas/
- Connection String Format: https://docs.mongodb.com/manual/reference/connection-string/
- Troubleshooting: https://docs.mongodb.com/atlas/troubleshooting-connection/


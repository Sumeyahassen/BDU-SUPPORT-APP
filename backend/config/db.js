const mongoose = require("mongoose");

const connectDB = async () => {
  const uri = process.env.MONGO_URI;

  if (!uri || typeof uri !== "string") {
    console.error(
      "❌ MONGO_URI environment variable is not set.\n" +
        "Set MONGO_URI to your MongoDB connection string (e.g. mongodb+srv://<user>:<pwd>@cluster0.mongodb.net/<db>?retryWrites=true&w=majority).\n" +
        "If you are deploying to Render / Heroku / Vercel, add the variable in the service's environment settings.\n"
    );
    // Exit early so deploy logs are clear instead of the generic mongoose openUri error
    process.exit(1);
  }

  try {
    // Mongoose v6+ uses sensible defaults; include explicit options if you prefer
    const conn = await mongoose.connect(uri, {
      // keep defaults, but options may be added here if needed
    });
    console.log(`✅ MongoDB Connected: ${conn.connection.host}`);
  } catch (err) {
    console.error(`❌ Error connecting to MongoDB: ${err.message}`);
    process.exit(1);
  }
};

module.exports = connectDB;

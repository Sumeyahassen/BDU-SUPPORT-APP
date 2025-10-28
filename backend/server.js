const express = require("express");
const cors = require("cors");
require("dotenv").config();

const connectDB = require("./config/db");

// Import routes
const courseRoutes = require("./routes/courseRoutes");
const departmentRoutes = require("./routes/departmentRoutes");
const examRoutes = require("./routes/examRoutes");
const resourceRoutes = require("./routes/resourceRoutes");
const exitExamRoutes = require("./routes/exitExamRoutes");

const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use("/uploads", express.static("uploads")); // serve PDFs & files

// DB connection
connectDB();

// Routes
app.use("/api/courses", courseRoutes);
app.use("/api/departments", departmentRoutes);
app.use("/api/exams", examRoutes);
app.use("/api/resources", resourceRoutes);
app.use("/api/exit-exams", exitExamRoutes);

// Start server
const PORT = process.env.PORT || 10000;
app.listen(PORT, "0.0.0.0", () => console.log(`✅ Server running on port ${PORT}`));

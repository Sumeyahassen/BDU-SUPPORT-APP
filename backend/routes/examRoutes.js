const express = require("express");
const router = express.Router();
const { uploadExam, getExams } = require("../controllers/examController");

// Route to upload a new exam (PDF, etc.)
router.post("/upload", uploadExam);

// Route to get exams by course/year
router.get("/:courseId", getExams);

module.exports = router;

const express = require("express");
const router = express.Router();
const { uploadExam, getExams, getAllExams } = require("../controllers/examController");

// Route to upload a new exam (PDF, etc.)
router.post("/upload", uploadExam);

// Route to get exams by course/year
router.get("/course/:courseId", getExams);

// Route to get all exams
router.get("/", getAllExams);

module.exports = router;

// controllers/examController.js
const Exam = require("../models/Exam");

// Upload a new exam (PDF file URL comes from req.body or multer upload)
const uploadExam = async (req, res) => {
  try {
    const newExam = new Exam({
      course: req.body.course || req.body.courseId, // Expect ObjectId string
      year: req.body.year,
      type: req.body.type, // "mid" | "final" | "quiz" | "assignment"
      title: req.body.title,
      description: req.body.description,
      fileUrl:
        req.body.fileUrl || (req.file ? `/uploads/${req.file.filename}` : null),
      semester: req.body.semester,
      duration: req.body.duration,
      totalMarks: req.body.totalMarks,
      tags: req.body.tags || []
    });

    const savedExam = await newExam.save();
    res.status(201).json(savedExam);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Get exams by course (ObjectId)
const getExams = async (req, res) => {
  try {
    const exams = await Exam.find({ course: req.params.courseId });
    res.json({ data: exams });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Get all exams
const getAllExams = async (_req, res) => {
  try {
    const exams = await Exam.find({});
    res.json({ data: exams });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = { uploadExam, getExams, getAllExams };

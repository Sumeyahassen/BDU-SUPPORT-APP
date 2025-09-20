// controllers/examController.js
const Exam = require("../models/Exam");

// Upload a new exam (PDF file URL comes from req.body or multer upload)
const uploadExam = async (req, res) => {
  try {
    const newExam = new Exam({
      courseId: req.body.courseId,
      year: req.body.year,
      type: req.body.type, // "mid" or "final"
      fileUrl:
        req.body.fileUrl || (req.file ? `/uploads/${req.file.filename}` : null),
    });

    const savedExam = await newExam.save();
    res.status(201).json(savedExam);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Get exams by courseId
const getExams = async (req, res) => {
  try {
    const exams = await Exam.find({ courseId: req.params.courseId });
    res.json(exams);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = { uploadExam, getExams };

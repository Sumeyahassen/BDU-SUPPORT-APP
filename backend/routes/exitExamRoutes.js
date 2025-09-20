const express = require("express");
const router = express.Router();
const ExitExam = require("../models/ExitExam");

// Get all exit exams by year
router.get("/:year", async (req, res) => {
  try {
    const exams = await ExitExam.find({ year: req.params.year }).populate(
      "department"
    );
    res.json(exams);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Upload new exit exam
router.post("/", async (req, res) => {
  try {
    const exam = new ExitExam(req.body);
    await exam.save();
    res.status(201).json(exam);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;

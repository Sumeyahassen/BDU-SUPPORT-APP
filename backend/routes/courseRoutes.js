const express = require("express");
const router = express.Router();
const Course = require("../models/Course");

// @desc Get all common courses
// @route GET /api/courses/common
router.get("/common", async (req, res) => {
  try {
    const courses = await Course.find({ isCommon: true });
    res.json(courses);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// @desc Get courses for a specific department
// @route GET /api/courses/:departmentId
router.get("/:departmentId", async (req, res) => {
  try {
    const courses = await Course.find({
      department: req.params.departmentId,
      isCommon: false,
    });
    res.json(courses);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;

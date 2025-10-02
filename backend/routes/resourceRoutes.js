const express = require("express");
const router = express.Router();
const Resource = require("../models/Resource");
const Course = require("../models/Course");

// @desc Add a resource (exam, book, video)
// @route POST /api/resources/add
router.post("/add", async (req, res) => {
  try {
    const { title, type, year, course, link } = req.body;

    if (!title || !type || !course || !link) {
      return res.status(400).json({ error: "Missing required fields" });
    }

    const resource = new Resource({ title, type, year, course, link });
    await resource.save();
    res.status(201).json({ data: resource });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// @desc Get resources by course and type
// @route GET /api/resources/:courseId/:type
router.get("/course/:courseId/:type", async (req, res) => {
  try {
    const { courseId, type } = req.params;
    const resources = await Resource.find({ course: courseId, type });
    res.json({ data: resources });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// @desc Get all resources for a course by code
// @route GET /api/resources/by-code/:code
router.get("/by-code/:code", async (req, res) => {
  try {
    const course = await Course.findOne({ code: req.params.code });
    if (!course) return res.status(404).json({ error: "Course not found" });
    const resources = await Resource.find({ course: course._id });
    res.json({ data: resources });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// @desc Get all resources for a course by id
// @route GET /api/resources/course/:courseId
router.get("/course/:courseId", async (req, res) => {
  try {
    const resources = await Resource.find({ course: req.params.courseId });
    res.json({ data: resources });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;

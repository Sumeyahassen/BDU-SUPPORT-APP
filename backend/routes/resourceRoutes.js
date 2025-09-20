const express = require("express");
const router = express.Router();
const Resource = require("../models/Resource");

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
    res.status(201).json(resource);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// @desc Get resources by course and type
// @route GET /api/resources/:courseId/:type
router.get("/:courseId/:type", async (req, res) => {
  try {
    const { courseId, type } = req.params;
    const resources = await Resource.find({ course: courseId, type });
    res.json(resources);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;

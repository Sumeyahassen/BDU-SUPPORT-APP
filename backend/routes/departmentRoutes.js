const express = require("express");
const router = express.Router();
const Department = require("../models/Department");

// 📌 Get all departments
router.get("/", async (req, res) => {
  try {
    const departments = await Department.find();
    res.json(departments);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// 📌 Add a new department
router.post("/", async (req, res) => {
  try {
    const department = new Department(req.body);
    await department.save();
    res.status(201).json(department);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;

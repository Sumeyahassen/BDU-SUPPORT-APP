const ExitExam = require("../models/ExitExam");

// Get all exit exams
const getAllExitExams = async (req, res) => {
  try {
    const exitExams = await ExitExam.find().populate("department", "name");
    res.json({
      success: true,
      data: exitExams
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Get exit exams by department
const getExitExamsByDepartment = async (req, res) => {
  try {
    const { departmentId } = req.params;
    const exitExams = await ExitExam.find({ department: departmentId })
      .populate("department", "name");
    res.json({
      success: true,
      data: exitExams
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Get exit exams by year
const getExitExamsByYear = async (req, res) => {
  try {
    const { year } = req.params;
    const exitExams = await ExitExam.find({ year: parseInt(year) })
      .populate("department", "name");
    res.json({
      success: true,
      data: exitExams
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Upload new exit exam
const uploadExitExam = async (req, res) => {
  try {
    const { department, year, title, description } = req.body;
    
    if (!department || !year || !title) {
      return res.status(400).json({
        success: false,
        error: "Missing required fields: department, year, title"
      });
    }

    const fileUrl = req.file ? `/uploads/${req.file.filename}` : req.body.fileUrl;
    
    if (!fileUrl) {
      return res.status(400).json({
        success: false,
        error: "File URL is required"
      });
    }

    const exitExam = new ExitExam({
      department,
      year: parseInt(year),
      title,
      description,
      fileUrl
    });

    const savedExam = await exitExam.save();
    await savedExam.populate("department", "name");
    
    res.status(201).json({
      success: true,
      data: savedExam
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Update exit exam
const updateExitExam = async (req, res) => {
  try {
    const { id } = req.params;
    const updateData = req.body;
    
    if (updateData.year) {
      updateData.year = parseInt(updateData.year);
    }

    const exitExam = await ExitExam.findByIdAndUpdate(
      id, 
      updateData, 
      { new: true, runValidators: true }
    ).populate("department", "name");

    if (!exitExam) {
      return res.status(404).json({
        success: false,
        error: "Exit exam not found"
      });
    }

    res.json({
      success: true,
      data: exitExam
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Delete exit exam
const deleteExitExam = async (req, res) => {
  try {
    const { id } = req.params;
    const exitExam = await ExitExam.findByIdAndDelete(id);

    if (!exitExam) {
      return res.status(404).json({
        success: false,
        error: "Exit exam not found"
      });
    }

    res.json({
      success: true,
      message: "Exit exam deleted successfully"
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

module.exports = {
  getAllExitExams,
  getExitExamsByDepartment,
  getExitExamsByYear,
  uploadExitExam,
  updateExitExam,
  deleteExitExam
};

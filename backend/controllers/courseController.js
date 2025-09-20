const Course = require("../models/Course");
const Department = require("../models/Department");

// Get all courses
const getAllCourses = async (req, res) => {
  try {
    const courses = await Course.find({ isActive: true })
      .populate("department", "name code")
      .sort({ name: 1 });
    
    res.json({
      success: true,
      data: courses
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Get common courses
const getCommonCourses = async (req, res) => {
  try {
    const courses = await Course.find({ 
      isCommon: true, 
      isActive: true 
    }).sort({ name: 1 });
    
    res.json({
      success: true,
      data: courses
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Get courses by department
const getCoursesByDepartment = async (req, res) => {
  try {
    const { departmentId } = req.params;
    const courses = await Course.find({ 
      department: departmentId, 
      isCommon: false,
      isActive: true 
    })
    .populate("department", "name code")
    .sort({ name: 1 });
    
    res.json({
      success: true,
      data: courses
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Get course by ID
const getCourseById = async (req, res) => {
  try {
    const { id } = req.params;
    const course = await Course.findById(id)
      .populate("department", "name code");
    
    if (!course) {
      return res.status(404).json({
        success: false,
        error: "Course not found"
      });
    }
    
    res.json({
      success: true,
      data: course
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Create new course
const createCourse = async (req, res) => {
  try {
    const { name, code, department, isCommon, description, credits, semester, level } = req.body;
    
    if (!name || !code) {
      return res.status(400).json({
        success: false,
        error: "Name and code are required"
      });
    }

    // Check if course code already exists
    const existingCourse = await Course.findOne({ code });
    if (existingCourse) {
      return res.status(400).json({
        success: false,
        error: "Course code already exists"
      });
    }

    const course = new Course({
      name,
      code,
      department: department || null,
      isCommon: isCommon || false,
      description,
      credits: credits || 3,
      semester,
      level: level || "undergraduate"
    });

    const savedCourse = await course.save();
    await savedCourse.populate("department", "name code");
    
    res.status(201).json({
      success: true,
      data: savedCourse
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Update course
const updateCourse = async (req, res) => {
  try {
    const { id } = req.params;
    const updateData = req.body;
    
    const course = await Course.findByIdAndUpdate(
      id, 
      updateData, 
      { new: true, runValidators: true }
    ).populate("department", "name code");

    if (!course) {
      return res.status(404).json({
        success: false,
        error: "Course not found"
      });
    }

    res.json({
      success: true,
      data: course
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Delete course (soft delete)
const deleteCourse = async (req, res) => {
  try {
    const { id } = req.params;
    const course = await Course.findByIdAndUpdate(
      id, 
      { isActive: false }, 
      { new: true }
    );

    if (!course) {
      return res.status(404).json({
        success: false,
        error: "Course not found"
      });
    }

    res.json({
      success: true,
      message: "Course deleted successfully"
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Search courses
const searchCourses = async (req, res) => {
  try {
    const { q, department, type } = req.query;
    let query = { isActive: true };
    
    if (q) {
      query.$or = [
        { name: { $regex: q, $options: 'i' } },
        { code: { $regex: q, $options: 'i' } },
        { description: { $regex: q, $options: 'i' } }
      ];
    }
    
    if (department) {
      query.department = department;
    }
    
    if (type === 'common') {
      query.isCommon = true;
    } else if (type === 'department') {
      query.isCommon = false;
    }
    
    const courses = await Course.find(query)
      .populate("department", "name code")
      .sort({ name: 1 });
    
    res.json({
      success: true,
      data: courses
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

module.exports = {
  getAllCourses,
  getCommonCourses,
  getCoursesByDepartment,
  getCourseById,
  createCourse,
  updateCourse,
  deleteCourse,
  searchCourses
};

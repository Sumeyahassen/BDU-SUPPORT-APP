const Department = require("../models/Department");
const Course = require("../models/Course");

// Get all departments
const getAllDepartments = async (req, res) => {
  try {
    const departments = await Department.find({ isActive: true })
      .sort({ name: 1 });
    
    res.json({
      success: true,
      data: departments
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Get department by ID
const getDepartmentById = async (req, res) => {
  try {
    const { id } = req.params;
    const department = await Department.findById(id);
    
    if (!department) {
      return res.status(404).json({
        success: false,
        error: "Department not found"
      });
    }
    
    res.json({
      success: true,
      data: department
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Create new department
const createDepartment = async (req, res) => {
  try {
    const { name, code, description, faculty, headOfDepartment, contactEmail } = req.body;
    
    if (!name || !code) {
      return res.status(400).json({
        success: false,
        error: "Name and code are required"
      });
    }

    // Check if department code already exists
    const existingDepartment = await Department.findOne({ code });
    if (existingDepartment) {
      return res.status(400).json({
        success: false,
        error: "Department code already exists"
      });
    }

    const department = new Department({
      name,
      code,
      description,
      faculty,
      headOfDepartment,
      contactEmail
    });

    const savedDepartment = await department.save();
    
    res.status(201).json({
      success: true,
      data: savedDepartment
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Update department
const updateDepartment = async (req, res) => {
  try {
    const { id } = req.params;
    const updateData = req.body;
    
    const department = await Department.findByIdAndUpdate(
      id, 
      updateData, 
      { new: true, runValidators: true }
    );

    if (!department) {
      return res.status(404).json({
        success: false,
        error: "Department not found"
      });
    }

    res.json({
      success: true,
      data: department
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Delete department (soft delete)
const deleteDepartment = async (req, res) => {
  try {
    const { id } = req.params;
    
    // Check if department has courses
    const coursesCount = await Course.countDocuments({ department: id, isActive: true });
    if (coursesCount > 0) {
      return res.status(400).json({
        success: false,
        error: "Cannot delete department with active courses"
      });
    }
    
    const department = await Department.findByIdAndUpdate(
      id, 
      { isActive: false }, 
      { new: true }
    );

    if (!department) {
      return res.status(404).json({
        success: false,
        error: "Department not found"
      });
    }

    res.json({
      success: true,
      message: "Department deleted successfully"
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Get department with courses
const getDepartmentWithCourses = async (req, res) => {
  try {
    const { id } = req.params;
    const department = await Department.findById(id);
    
    if (!department) {
      return res.status(404).json({
        success: false,
        error: "Department not found"
      });
    }
    
    const courses = await Course.find({ 
      department: id, 
      isActive: true 
    }).sort({ name: 1 });
    
    res.json({
      success: true,
      data: {
        department,
        courses
      }
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Search departments
const searchDepartments = async (req, res) => {
  try {
    const { q } = req.query;
    let query = { isActive: true };
    
    if (q) {
      query.$or = [
        { name: { $regex: q, $options: 'i' } },
        { code: { $regex: q, $options: 'i' } },
        { description: { $regex: q, $options: 'i' } },
        { faculty: { $regex: q, $options: 'i' } }
      ];
    }
    
    const departments = await Department.find(query)
      .sort({ name: 1 });
    
    res.json({
      success: true,
      data: departments
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

module.exports = {
  getAllDepartments,
  getDepartmentById,
  createDepartment,
  updateDepartment,
  deleteDepartment,
  getDepartmentWithCourses,
  searchDepartments
};

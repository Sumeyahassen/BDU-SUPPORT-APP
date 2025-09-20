const Resource = require("../models/Resource");
const Course = require("../models/Course");

// Get all resources
const getAllResources = async (req, res) => {
  try {
    const { type, course, year, semester, page = 1, limit = 20 } = req.query;
    let query = { isActive: true };
    
    if (type) {
      query.type = type;
    }
    
    if (course) {
      query.course = course;
    }
    
    if (year) {
      query.year = parseInt(year);
    }
    
    if (semester) {
      query.semester = parseInt(semester);
    }
    
    const skip = (parseInt(page) - 1) * parseInt(limit);
    
    const resources = await Resource.find(query)
      .populate("course", "name code")
      .sort({ createdAt: -1 })
      .skip(skip)
      .limit(parseInt(limit));
    
    const total = await Resource.countDocuments(query);
    
    res.json({
      success: true,
      data: resources,
      pagination: {
        current: parseInt(page),
        pages: Math.ceil(total / parseInt(limit)),
        total
      }
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Get resources by course and type
const getResourcesByCourseAndType = async (req, res) => {
  try {
    const { courseId, type } = req.params;
    const { year, semester } = req.query;
    
    let query = { 
      course: courseId, 
      type, 
      isActive: true 
    };
    
    if (year) {
      query.year = parseInt(year);
    }
    
    if (semester) {
      query.semester = parseInt(semester);
    }
    
    const resources = await Resource.find(query)
      .populate("course", "name code")
      .sort({ year: -1, createdAt: -1 });
    
    res.json({
      success: true,
      data: resources
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Get resource by ID
const getResourceById = async (req, res) => {
  try {
    const { id } = req.params;
    const resource = await Resource.findById(id)
      .populate("course", "name code");
    
    if (!resource) {
      return res.status(404).json({
        success: false,
        error: "Resource not found"
      });
    }
    
    // Increment download count
    resource.downloadCount += 1;
    await resource.save();
    
    res.json({
      success: true,
      data: resource
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Create new resource
const createResource = async (req, res) => {
  try {
    const { 
      course, 
      type, 
      title, 
      description, 
      fileUrl, 
      videoUrl, 
      link, 
      year, 
      semester, 
      author, 
      tags 
    } = req.body;
    
    if (!course || !type || !title) {
      return res.status(400).json({
        success: false,
        error: "Course, type, and title are required"
      });
    }

    // Verify course exists
    const courseExists = await Course.findById(course);
    if (!courseExists) {
      return res.status(400).json({
        success: false,
        error: "Course not found"
      });
    }

    const resource = new Resource({
      course,
      type,
      title,
      description,
      fileUrl: fileUrl || (req.file ? `/uploads/${req.file.filename}` : null),
      videoUrl,
      link,
      year: year ? parseInt(year) : null,
      semester: semester ? parseInt(semester) : null,
      author,
      tags: tags ? tags.split(',').map(tag => tag.trim()) : []
    });

    const savedResource = await resource.save();
    await savedResource.populate("course", "name code");
    
    res.status(201).json({
      success: true,
      data: savedResource
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Update resource
const updateResource = async (req, res) => {
  try {
    const { id } = req.params;
    const updateData = req.body;
    
    // Handle file upload
    if (req.file) {
      updateData.fileUrl = `/uploads/${req.file.filename}`;
    }
    
    // Handle tags
    if (updateData.tags && typeof updateData.tags === 'string') {
      updateData.tags = updateData.tags.split(',').map(tag => tag.trim());
    }
    
    const resource = await Resource.findByIdAndUpdate(
      id, 
      updateData, 
      { new: true, runValidators: true }
    ).populate("course", "name code");

    if (!resource) {
      return res.status(404).json({
        success: false,
        error: "Resource not found"
      });
    }

    res.json({
      success: true,
      data: resource
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Delete resource (soft delete)
const deleteResource = async (req, res) => {
  try {
    const { id } = req.params;
    const resource = await Resource.findByIdAndUpdate(
      id, 
      { isActive: false }, 
      { new: true }
    );

    if (!resource) {
      return res.status(404).json({
        success: false,
        error: "Resource not found"
      });
    }

    res.json({
      success: true,
      message: "Resource deleted successfully"
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Search resources
const searchResources = async (req, res) => {
  try {
    const { q, type, course, year, semester, page = 1, limit = 20 } = req.query;
    let query = { isActive: true };
    
    if (q) {
      query.$or = [
        { title: { $regex: q, $options: 'i' } },
        { description: { $regex: q, $options: 'i' } },
        { author: { $regex: q, $options: 'i' } },
        { tags: { $in: [new RegExp(q, 'i')] } }
      ];
    }
    
    if (type) {
      query.type = type;
    }
    
    if (course) {
      query.course = course;
    }
    
    if (year) {
      query.year = parseInt(year);
    }
    
    if (semester) {
      query.semester = parseInt(semester);
    }
    
    const skip = (parseInt(page) - 1) * parseInt(limit);
    
    const resources = await Resource.find(query)
      .populate("course", "name code")
      .sort({ createdAt: -1 })
      .skip(skip)
      .limit(parseInt(limit));
    
    const total = await Resource.countDocuments(query);
    
    res.json({
      success: true,
      data: resources,
      pagination: {
        current: parseInt(page),
        pages: Math.ceil(total / parseInt(limit)),
        total
      }
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Get popular resources
const getPopularResources = async (req, res) => {
  try {
    const { limit = 10 } = req.query;
    
    const resources = await Resource.find({ isActive: true })
      .populate("course", "name code")
      .sort({ downloadCount: -1 })
      .limit(parseInt(limit));
    
    res.json({
      success: true,
      data: resources
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

// Get resources by type
const getResourcesByType = async (req, res) => {
  try {
    const { type } = req.params;
    const { page = 1, limit = 20 } = req.query;
    
    const skip = (parseInt(page) - 1) * parseInt(limit);
    
    const resources = await Resource.find({ 
      type, 
      isActive: true 
    })
      .populate("course", "name code")
      .sort({ createdAt: -1 })
      .skip(skip)
      .limit(parseInt(limit));
    
    const total = await Resource.countDocuments({ type, isActive: true });
    
    res.json({
      success: true,
      data: resources,
      pagination: {
        current: parseInt(page),
        pages: Math.ceil(total / parseInt(limit)),
        total
      }
    });
  } catch (err) {
    res.status(500).json({ 
      success: false,
      error: err.message 
    });
  }
};

module.exports = {
  getAllResources,
  getResourcesByCourseAndType,
  getResourceById,
  createResource,
  updateResource,
  deleteResource,
  searchResources,
  getPopularResources,
  getResourcesByType
};

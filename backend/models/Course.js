const mongoose = require("mongoose");

const CourseSchema = new mongoose.Schema({
  name: { type: String, required: true },
  code: { type: String, required: true, unique: true },
  department: { type: mongoose.Schema.Types.ObjectId, ref: "Department" },
  isCommon: { type: Boolean, default: false },
  description: { type: String },
  credits: { type: Number, default: 3 },
  semester: { type: Number },
  level: { type: String, enum: ["undergraduate", "graduate"], default: "undergraduate" },
  createdAt: { type: Date, default: Date.now },
  updatedAt: { type: Date, default: Date.now }
});

// Update the updatedAt field before saving
CourseSchema.pre('save', function(next) {
  this.updatedAt = Date.now();
  next();
});

module.exports = mongoose.model("Course", CourseSchema);

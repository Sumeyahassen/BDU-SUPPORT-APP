const mongoose = require("mongoose");

const ExamSchema = new mongoose.Schema({
  course: { type: mongoose.Schema.Types.ObjectId, ref: "Course", required: true },
  type: { type: String, enum: ["mid", "final", "quiz", "assignment"], required: true },
  year: { type: Number, required: true },
  title: { type: String, required: true },
  description: { type: String },
  fileUrl: { type: String, required: true }, // PDF stored
  semester: { type: String, enum: ["Spring", "Summer", "Fall"], default: "Spring" },
  duration: { type: Number }, // Duration in minutes
  totalMarks: { type: Number },
  isActive: { type: Boolean, default: true },
  downloadCount: { type: Number, default: 0 },
  tags: [{ type: String }],
  createdAt: { type: Date, default: Date.now },
  updatedAt: { type: Date, default: Date.now }
});

// Update the updatedAt field before saving
ExamSchema.pre('save', function(next) {
  this.updatedAt = Date.now();
  next();
});

// Index for better query performance
ExamSchema.index({ course: 1, type: 1, year: 1 });
ExamSchema.index({ type: 1, year: 1, isActive: 1 });

module.exports = mongoose.model("Exam", ExamSchema);

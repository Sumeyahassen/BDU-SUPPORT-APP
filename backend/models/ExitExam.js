const mongoose = require("mongoose");

const ExitExamSchema = new mongoose.Schema({
  department: { type: mongoose.Schema.Types.ObjectId, ref: "Department", required: true },
  year: { type: Number, required: true },
  title: { type: String, required: true },
  description: { type: String },
  fileUrl: { type: String, required: true }, // PDF stored
  university: { type: String, default: "BDU" },
  semester: { type: String, enum: ["Spring", "Summer", "Fall"], default: "Spring" },
  isActive: { type: Boolean, default: true },
  downloadCount: { type: Number, default: 0 },
  tags: [{ type: String }],
  createdAt: { type: Date, default: Date.now },
  updatedAt: { type: Date, default: Date.now }
});

// Update the updatedAt field before saving
ExitExamSchema.pre('save', function(next) {
  this.updatedAt = Date.now();
  next();
});

// Index for better query performance
ExitExamSchema.index({ department: 1, year: 1 });
ExitExamSchema.index({ year: 1, isActive: 1 });

module.exports = mongoose.model("ExitExam", ExitExamSchema);

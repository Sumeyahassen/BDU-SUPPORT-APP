const mongoose = require("mongoose");

const ResourceSchema = new mongoose.Schema({
  course: { type: mongoose.Schema.Types.ObjectId, ref: "Course", required: true },
  type: { 
    type: String, 
    enum: ["book", "lecture", "video", "exam", "note"], 
    required: true 
  },
  title: { type: String, required: true },
  description: { type: String },
  fileUrl: { type: String }, // PDF stored locally or cloud
  videoUrl: { type: String }, // YouTube link
  link: { type: String }, // External link
  year: { type: Number },
  semester: { type: Number },
  author: { type: String },
  isActive: { type: Boolean, default: true },
  downloadCount: { type: Number, default: 0 },
  tags: [{ type: String }],
  createdAt: { type: Date, default: Date.now },
  updatedAt: { type: Date, default: Date.now }
});

// Update the updatedAt field before saving
ResourceSchema.pre('save', function(next) {
  this.updatedAt = Date.now();
  next();
});

// Index for better query performance
ResourceSchema.index({ course: 1, type: 1 });
ResourceSchema.index({ type: 1, isActive: 1 });

module.exports = mongoose.model("Resource", ResourceSchema);

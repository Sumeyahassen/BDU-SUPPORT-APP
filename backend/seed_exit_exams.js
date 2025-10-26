const path = require("path");
const fs = require("fs");
const mongoose = require("mongoose");
require("dotenv").config();

const Department = require("./models/Department");
const ExitExam = require("./models/ExitExam");

async function connect() {
  const uri = process.env.MONGO_URI;
  if (!uri) throw new Error("MONGO_URI not set in environment");
  await mongoose.connect(uri);
}

async function seedExitExams() {
  const file = path.join(__dirname, "seed_exit_exams.json");
  const payload = JSON.parse(fs.readFileSync(file, "utf-8"));

  await connect();

  // Get department mapping
  const departments = await Department.find({});
  const deptMap = new Map();
  departments.forEach(dept => {
    deptMap.set(dept.code, dept._id);
  });

  for (const examData of payload.exitExams) {
    const departmentId = deptMap.get(examData.departmentCode);
    if (!departmentId) {
      console.log(`⚠️  Department ${examData.departmentCode} not found, skipping exam: ${examData.title}`);
      continue;
    }

    // Check if exam already exists
    const existing = await ExitExam.findOne({
      department: departmentId,
      year: examData.year,
      title: examData.title
    });

    if (existing) {
      console.log(`⚠️  Exam already exists: ${examData.title} (${examData.year})`);
      continue;
    }

    const exam = new ExitExam({
      department: departmentId,
      year: examData.year,
      title: examData.title,
      description: examData.description || "",
      fileUrl: examData.fileUrl,
      university: examData.university || "BDU",
      semester: examData.semester || "Spring",
      tags: examData.tags || []
    });

    await exam.save();
    console.log(`✅ Inserted exit exam: ${examData.title} (${examData.departmentCode}, ${examData.year})`);
  }

  console.log("✅ Exit exam seeding completed.");
}

seedExitExams()
  .catch(err => {
    console.error("❌ Seeding exit exams failed:", err.message);
    process.exit(1);
  })
  .finally(async () => {
    await mongoose.connection.close();
  });


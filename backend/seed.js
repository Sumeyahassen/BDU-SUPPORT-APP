const path = require("path");
const fs = require("fs");
const mongoose = require("mongoose");
require("dotenv").config();

const Department = require("./models/Department");
const Course = require("./models/Course");

// Simple mapping from frontend IDs to backend fields
function buildDepartmentsFromFrontend() {
  // These mirror lib/data/mock/mock_departments.dart
  return [
    { name: "Software Engineering", code: "se" },
    { name: "Computer Science", code: "cs" },
    { name: "Information Technology", code: "it" },
    { name: "Information Systems", code: "is" },
    { name: "Cyber Security", code: "cyb" }
  ];
}

function buildCoursesFromFrontend() {
  // Common courses -> isCommon=true
  const commonCourses = [
    { code: "cpp", name: "C++" },
    { code: "java", name: "Java" },
    { code: "db", name: "Database" },
    { code: "coa", name: "Computer Organization and Architecture" },
    { code: "mpa", name: "Microprocessor and Assembly Language" },
    { code: "os", name: "Operating System" },
    { code: "net", name: "Networking" },
    { code: "ds", name: "Distributed System" },
    { code: "cloud", name: "Cloud Computing & IoT" },
    { code: "web", name: "Web Development" },
    { code: "mobile", name: "Mobile App Development" },
    { code: "ai", name: "Artificial Intelligence" }
  ].map(c => ({ ...c, isCommon: true }));

  // Department courses from lib/data/mock/mock_courses.dart (subset shown)
  const departmentCourses = [
    { code: "oose", name: "Object Oriented Software Engineering", departmentCode: "se" },
    { code: "sw_req", name: "Software Requirement", departmentCode: "se" },
    { code: "ai", name: "Artificial Intelligence", departmentCode: "cs" },
    { code: "ds_algo", name: "Data Structures and Algorithms", departmentCode: "cs" },
    { code: "cloud", name: "Cloud Computing", departmentCode: "it" },
    { code: "network_admin", name: "Network Administration", departmentCode: "it" },
    { code: "erp", name: "Enterprise Resource Planning", departmentCode: "is" },
    { code: "bpm", name: "Business Process Modeling", departmentCode: "is" },
    { code: "netsec", name: "Network Security", departmentCode: "cyb" },
    { code: "crypto", name: "Cryptography", departmentCode: "cyb" }
  ];

  return { commonCourses, departmentCourses };
}

async function connect() {
  const uri = process.env.MONGO_URI;
  if (!uri) {
    throw new Error("MONGO_URI not set in environment");
  }
  await mongoose.connect(uri);
}

async function seed() {
  await connect();

  // Clear existing minimal data to make the script idempotent for dev
  await Course.deleteMany({});
  await Department.deleteMany({});

  const deptPayloads = buildDepartmentsFromFrontend();
  const deptDocs = await Department.insertMany(
    deptPayloads.map(d => ({
      name: d.name,
      code: d.code,
      description: `${d.name} Department`,
      isActive: true
    }))
  );

  const codeToDeptId = new Map();
  for (const d of deptDocs) {
    codeToDeptId.set(d.code, d._id);
  }

  const { commonCourses, departmentCourses } = buildCoursesFromFrontend();
  const coursePayloads = [];
  const usedCodes = new Set();

  for (const c of commonCourses) {
    coursePayloads.push({
      name: c.name,
      code: c.code,
      isCommon: true,
      description: c.name,
      credits: 3
    });
    usedCodes.add(c.code);
  }

  for (const c of departmentCourses) {
    const departmentId = codeToDeptId.get(c.departmentCode);
    if (!departmentId) continue;
    // Ensure unique course code across all courses
    let uniqueCode = c.code;
    if (usedCodes.has(uniqueCode)) {
      uniqueCode = `${c.departmentCode}_${c.code}`;
    }
    usedCodes.add(uniqueCode);

    coursePayloads.push({
      name: c.name,
      code: uniqueCode,
      department: departmentId,
      isCommon: false,
      description: c.name,
      credits: 3
    });
  }

  await Course.insertMany(coursePayloads);

  console.log("✅ Seed completed: departments and courses inserted.");
}

seed()
  .catch(err => {
    console.error("❌ Seed failed:", err);
    process.exit(1);
  })
  .finally(async () => {
    await mongoose.connection.close();
  });



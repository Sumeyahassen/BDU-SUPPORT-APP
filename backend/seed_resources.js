const fs = require("fs");
const path = require("path");
const mongoose = require("mongoose");
require("dotenv").config();

const Course = require("./models/Course");
const Resource = require("./models/Resource");

async function connect() {
  const uri = process.env.MONGO_URI;
  if (!uri) throw new Error("MONGO_URI not set in environment");
  await mongoose.connect(uri);
}

async function upsertResourcesForCourse(courseCode, resourcesPayload) {
  const course = await Course.findOne({ code: courseCode });
  if (!course) {
    throw new Error(`Course with code ${courseCode} not found. Seed courses first.`);
  }

  const resources = resourcesPayload.map(r => ({
    course: course._id,
    type: r.type,
    title: r.title,
    description: r.description || r.title,
    fileUrl: r.fileUrl,
    videoUrl: r.videoUrl,
    link: r.link,
    year: r.year,
    semester: r.semester,
    author: r.author,
    tags: r.tags || []
  }));

  await Resource.deleteMany({ course: course._id });
  await Resource.insertMany(resources);
  console.log(`✅ Inserted ${resources.length} resources for course ${course.name} (${course.code}).`);
}

async function seedResources() {
  const file = path.join(__dirname, "seed_resources.json");
  const payload = JSON.parse(fs.readFileSync(file, "utf-8"));

  await connect();

  if (payload.courseCode && payload.resources) {
    await upsertResourcesForCourse(payload.courseCode, payload.resources);
  } else if (Array.isArray(payload.courses)) {
    for (const entry of payload.courses) {
      await upsertResourcesForCourse(entry.courseCode, entry.resources || []);
    }
  } else {
    throw new Error("seed_resources.json must include either {courseCode, resources} or {courses: [...]} format.");
  }
}

seedResources()
  .catch(err => {
    console.error("❌ Seeding resources failed:", err.message);
    process.exit(1);
  })
  .finally(async () => {
    await mongoose.connection.close();
  });



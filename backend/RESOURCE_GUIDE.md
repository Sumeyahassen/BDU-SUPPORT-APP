# How to Add Resources for Other Subjects

This guide explains how to add educational resources (videos, notes, books, exams) to the database for different subjects/courses.

## Overview

Resources are stored in `backend/seed_resources.json` and are imported into the MongoDB database using the `seed_resources.js` script.

## Step-by-Step Process

### 1. Understand the Structure

The `seed_resources.json` file follows this structure:

```json
{
  "courses": [
    {
      "courseCode": "cpp",
      "resources": [
        {
          "type": "video",
          "title": "Course Title",
          "videoUrl": "https://youtube.com/watch?v=...",
          "tags": ["cpp", "beginner"]
        },
        {
          "type": "note",
          "title": "Tutorial Reference",
          "link": "https://example.com/tutorial",
          "tags": ["tutorial", "reference"]
        }
      ]
    }
  ]
}
```

### 2. Resource Types

The system supports the following resource types:

- **video**: YouTube videos or other video content (use `videoUrl`)
- **note**: Online articles, tutorials, documentation (use `link`)
- **book**: Books, eBooks, textbooks (use `link` or `fileUrl`)
- **exam**: Practice exams, previous year questions (use `fileUrl` or `link`)
- **lecture**: Lecture materials, slides (use `fileUrl`)

### 3. Fields for Each Resource

- **type** (required): One of `video`, `note`, `book`, `exam`, `lecture`
- **title** (required): Title of the resource
- **description** (optional): Additional description
- **videoUrl** (for videos): URL to video content
- **link** (for notes/books): URL to external resource
- **fileUrl** (for files): URL or path to downloadable file
- **tags** (optional): Array of tags for categorization
- **year** (optional): Year of the resource
- **semester** (optional): Semester number
- **author** (optional): Author or creator name

### 4. Course Codes

Available course codes from `seed.js`:

**Common Courses:**
- `cpp` - C++
- `java` - Java
- `db` - Database
- `coa` - Computer Organization and Architecture
- `mpa` - Microprocessor and Assembly Language
- `os` - Operating System
- `net` - Networking
- `ds` - Distributed System
- `cloud` - Cloud Computing & IoT
- `web` - Web Development
- `mobile` - Mobile App Development
- `ai` - Artificial Intelligence

**Department Courses:**
- `oose` - Object Oriented Software Engineering (SE)
- `sw_req` - Software Requirement (SE)
- `ds_algo` - Data Structures and Algorithms (CS)
- `network_admin` - Network Administration (IT)
- `erp` - Enterprise Resource Planning (IS)
- `bpm` - Business Process Modeling (IS)
- `netsec` - Network Security (Cyb)
- `crypto` - Cryptography (Cyb)

### 5. Adding Resources for a Subject

To add resources for a specific subject:

1. **Open** `backend/seed_resources.json`
2. **Find** the course entry by `courseCode`
3. **Replace** the existing resources array with your subject-specific resources

Example for C++:
```json
{
  "courseCode": "cpp",
  "resources": [
    {
      "type": "video",
      "title": "C++ Full Course for Beginners",
      "videoUrl": "https://www.youtube.com/watch?v=vLnPwxZdW4Y",
      "tags": ["cpp", "beginner", "course"]
    },
    {
      "type": "note",
      "title": "GeeksforGeeks C++ Tutorial",
      "link": "https://www.geeksforgeeks.org/cplusplus/",
      "tags": ["tutorial", "reference"]
    },
    {
      "type": "book",
      "title": "The C++ Programming Language - Bjarne Stroustrup",
      "link": "https://www.stroustrup.com/",
      "tags": ["book", "reference"]
    }
  ]
}
```

### 6. Seed the Database

After updating the JSON file, run the seed script:

```bash
# From the backend directory
node seed_resources.js
```

This will:
- Connect to your MongoDB database
- Delete existing resources for each course
- Insert the new resources from the JSON file

### 7. Verify Resources

You can verify the resources were added by:
- Checking the backend logs for confirmation messages
- Querying the database directly
- Using the API endpoint: `GET /api/resources?course=<courseCode>`

## Tips

1. **Replace placeholders**: Look for `REPLACE_WITH_...` in the current file and replace with actual URLs
2. **Diverse resources**: Include a mix of videos, notes, books, and practice materials
3. **Proper tags**: Use descriptive tags to help with search and filtering
4. **Valid URLs**: Ensure all URLs are accessible and working
5. **Course codes**: Make sure course codes match those defined in `seed.js`

## Example: Complete Resource Entry

```json
{
  "courseCode": "os",
  "resources": [
    {
      "type": "video",
      "title": "Operating System Full Course",
      "videoUrl": "https://www.youtube.com/watch?v=vBURTtXv3nA",
      "tags": ["os", "course"],
      "description": "Complete OS course covering all major topics"
    },
    {
      "type": "note",
      "title": "Tutorialspoint Operating System",
      "link": "https://www.tutorialspoint.com/operating_system/index.htm",
      "tags": ["tutorial", "reference"]
    },
    {
      "type": "book",
      "title": "Operating System Concepts - Silberschatz",
      "link": "https://www.os-book.com/",
      "tags": ["book", "textbook"],
      "author": "Silberschatz, Galvin, Gagne"
    },
    {
      "type": "exam",
      "title": "OS Practice Questions",
      "link": "https://www.geeksforgeeks.org/operating-systems/",
      "tags": ["exam", "practice"]
    }
  ]
}
```

## Troubleshooting

**Error: Course not found**
- Verify the course code exists in `seed.js`
- Check spelling and case sensitivity

**Error: Invalid resource type**
- Use only: `video`, `note`, `book`, `exam`, `lecture`

**Resources not appearing**
- Check MongoDB connection
- Verify the seed script completed successfully
- Check API endpoint for that course

## Questions?

For more information, see:
- `backend/seed_resources.js` - Seeding script
- `backend/models/Resource.js` - Resource model schema
- `backend/routes/resourceRoutes.js` - API endpoints


# How to Add Exit Exam Resources

This guide explains how to add exit exam PDF resources to the database.

## Overview

Exit exams are stored in a separate collection from course resources. They are linked to departments and include PDF files for different years.

## File Structure

- `backend/seed_exit_exams.js` - Script to seed exit exam data
- `backend/seed_exit_exams.json` - JSON file containing exit exam entries

## Adding Exit Exams

### Step 1: Edit the JSON File

Open `backend/seed_exit_exams.json` and add your exit exam entries:

```json
{
  "exitExams": [
    {
      "departmentCode": "se",
      "year": 2024,
      "title": "Software Engineering Exit Exam 2024",
      "description": "Bachelor's degree exit exam for Software Engineering Department",
      "fileUrl": "https://YOUR_DOMAIN/uploads/exit_exams/se_2024.pdf",
      "university": "BDU",
      "semester": "Spring",
      "tags": ["exit-exam", "2024", "se"]
    }
  ]
}
```

### Step 2: Field Descriptions

- **departmentCode**: Department code (se, cs, it, is, cyb)
- **year**: Year of the exam (e.g., 2024, 2023, 2022)
- **title**: Title of the exam
- **description**: Description of the exam
- **fileUrl**: URL to the PDF file (can be local path or external URL)
- **university**: University name (default: "BDU")
- **semester**: Semester (Spring, Summer, Fall)
- **tags**: Tags for categorization

### Step 3: Upload PDF Files

Before running the seed script, you need to:

1. **Store PDF files** on your server or cloud storage
2. **Update fileUrl** in the JSON to point to the actual PDF location

Example file paths:
- Local server: `http://localhost:5000/uploads/exit_exams/se_2024.pdf`
- Cloud storage: `https://yourstorage.com/exams/se_2024.pdf`
- Absolute path: `/path/to/uploads/se_2024.pdf`

### Step 4: Run the Seed Script

```bash
cd backend
node seed_exit_exams.js
```

This will:
- Connect to MongoDB
- Load the exit exam data from JSON
- Insert new exit exams into the database
- Skip exams that already exist

### Step 5: Verify

Check that exit exams were added:

```bash
# Get exit exams for a specific year
curl http://localhost:5000/api/exit-exams/2023

# Get exit exams for a specific department
curl http://localhost:5000/api/departments/se
```

## Current Exit Exam Entries

The seed file includes sample entries for:
- Software Engineering (se) - Years 2021-2023
- Computer Science (cs) - Years 2021-2023
- Information Technology (it) - Years 2022-2023
- Information Systems (is) - Years 2022-2023
- Cyber Security (cyb) - Years 2022-2023

All entries currently have placeholder URLs that need to be replaced with actual PDF URLs.

## Replacing Placeholder URLs

Find all "REPLACE_WITH_ACTUAL_PDF_URL" entries and replace them with real PDF URLs:

```bash
# Example: Replace all SE placeholders with actual URLs
# Edit seed_exit_exams.json and replace:
"fileUrl": "https://REPLACE_WITH_ACTUAL_PDF_URL_2023_SE"
# With:
"fileUrl": "https://yourdomain.com/uploads/exit_exams/se_2023.pdf"
```

## Department Codes

Available department codes:
- `se` - Software Engineering
- `cs` - Computer Science  
- `it` - Information Technology
- `is` - Information Systems
- `cyb` - Cyber Security

## File Upload Structure

For better organization, structure your uploads directory like:

```
backend/uploads/
  exit_exams/
    se_2023.pdf
    se_2022.pdf
    cs_2023.pdf
    it_2023.pdf
    ...
```

Then update fileUrl to: `http://localhost:5000/uploads/exit_exams/se_2023.pdf`

## API Endpoints

Exit exams are accessible via:
- `GET /api/exit-exams/:year` - Get all exit exams for a year
- `POST /api/exit-exams/` - Upload a new exit exam

## Troubleshooting

**Error: Department not found**
- Verify the department code exists in your database
- Run `node seed.js` first to seed departments

**Error: Exam already exists**
- The script will skip duplicate exams
- To update, delete the existing exam first

**PDF not loading**
- Verify the fileUrl is correct
- Check file permissions
- Ensure the PDF file exists at the specified path

## Next Steps

1. Replace all placeholder URLs with actual PDF file paths
2. Upload PDF files to your server or cloud storage
3. Run `node seed_exit_exams.js`
4. Verify exit exams appear in your app
5. Test the download functionality

## Questions?

For more information, see:
- `backend/models/ExitExam.js` - Exit exam model schema
- `backend/routes/exitExamRoutes.js` - API endpoints
- `backend/seed_exit_exams.js` - Seeding script


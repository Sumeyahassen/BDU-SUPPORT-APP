# BDU Exam App Backend Setup

## Quick Start

### 1. Install Dependencies

```bash
cd backend
npm install
```

### 2. Setup MongoDB

- Install MongoDB locally or use MongoDB Atlas
- Update `config.env` with your MongoDB connection string

### 3. Start the Server

```bash
# Development mode
npm run dev

# Production mode
npm start
```

## Authentication Options

### Option 1: Guest Access (Recommended for Students)

Students can access the app without registration:

**API Endpoint:** `POST /api/auth/guest`

```json
{
  "success": true,
  "token": "jwt_token_here",
  "user": {
    "id": "user_id",
    "name": "Guest Student",
    "role": "student",
    "isGuest": true
  }
}
```

### Option 2: Public Routes (No Authentication)

Students can access exams directly without any authentication:

**Available Public Endpoints:**

- `GET /api/public/exams` - Get all active exams
- `GET /api/public/exams/:id` - Get specific exam
- `GET /api/public/exams/:examId/questions` - Get exam questions
- `POST /api/public/results` - Submit exam results

### Option 3: Full Authentication

For teachers and admins who need to manage exams:

**Register:** `POST /api/auth/register`
**Login:** `POST /api/auth/login`

## API Usage Examples

### For Flutter App (Guest Access)

```dart
// Get guest access
final response = await http.post(
  Uri.parse('http://localhost:3000/api/auth/guest'),
  headers: {'Content-Type': 'application/json'},
);

// Use the token for authenticated requests
final token = response.data['token'];
```

### For Flutter App (Public Access)

```dart
// Get exams without authentication
final response = await http.get(
  Uri.parse('http://localhost:3000/api/public/exams'),
  headers: {'Content-Type': 'application/json'},
);

// Submit exam results
final resultResponse = await http.post(
  Uri.parse('http://localhost:3000/api/public/results'),
  headers: {'Content-Type': 'application/json'},
  body: jsonEncode({
    'examId': 'exam_id',
    'studentName': 'John Doe',
    'answers': [
      {
        'question': 'question_id',
        'selectedAnswer': 'answer_text'
      }
    ]
  }),
);
```

## Environment Variables

Update `config.env`:

```
PORT=3000
MONGODB_URI=mongodb://localhost:27017/bdu_exam_app
JWT_SECRET=your-secret-key
JWT_EXPIRE=24h
```

## Database Models

- **User**: Students, teachers, admins
- **Department**: Academic departments
- **Exam**: Exam sessions and configurations
- **Question**: Exam questions with options
- **Result**: Student exam results and analytics

## Security Features

- JWT authentication for protected routes
- Role-based access control (student, teacher, admin)
- Password hashing with bcrypt
- Input validation and sanitization
- CORS configuration for Flutter app

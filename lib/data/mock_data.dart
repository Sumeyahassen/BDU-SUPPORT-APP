import '../models/faculty.dart';
import '../models/course.dart';

final mockFaculties = [
  Faculty(name: 'Engineering', departments: ['Computer Science', 'Electrical']),
  Faculty(name: 'Business', departments: ['Accounting', 'Marketing']),
];

final mockCourses = {
  'Computer Science': [
    Course(
      title: 'Database Systems',
      materials: ['DB_Textbook.pdf', 'Lecture_Notes.pdf'],
      exams: ['DB_Mid_2023.pdf', 'DB_Final_2023.pdf'],
      videos: ['https://youtube.com/db-crash-course'],
    ),
  ],
  'Accounting': [
    Course(
      title: 'Financial Accounting I',
      materials: ['FA1_Textbook.pdf'],
      exams: ['FA1_Final_2022.pdf'],
      videos: ['https://youtube.com/acc-basic'],
    ),
  ],
};

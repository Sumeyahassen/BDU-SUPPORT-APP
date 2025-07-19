import '../models/course.dart';

final List<Course> mockCommonCourses = [
  Course(
    id: 'cpp',
    name: 'C++',
    videoUrls: [],
    lectureNotes: [],
    bookLinks: [],
    examLinks: [],
  ),
  // ... other common courses ...
];

final List<Course> mockDepartmentCourses = [
  // Software Engineering
  Course(
    id: 'oose',
    name: 'Object Oriented Software Engineering',
    departmentId: 'se',
    videoUrls: [],
    lectureNotes: [],
    bookLinks: [],
    examLinks: [],
  ),
  Course(
    id: 'sw_req',
    name: 'Software Requirement',
    departmentId: 'se',
    videoUrls: [],
    lectureNotes: [],
    bookLinks: [],
    examLinks: [],
  ),
  // ... other SE courses ...
  // Computer Science
  Course(
    id: 'num_analysis',
    name: 'Numerical Analysis',
    departmentId: 'cs',
    videoUrls: [],
    lectureNotes: [],
    bookLinks: [],
    examLinks: [],
  ),
  // ... other CS courses ...
  // Cyber Security
  Course(
    id: 'sw_security',
    name: 'Software Security',
    departmentId: 'cyb',
    videoUrls: [],
    lectureNotes: [],
    bookLinks: [],
    examLinks: [],
  ),
  // ... other Cyber Security courses ...
  // Information Technology
  Course(
    id: 'embedded',
    name: 'Embedded Systems',
    departmentId: 'it',
    videoUrls: [],
    lectureNotes: [],
    bookLinks: [],
    examLinks: [],
  ),
  // ... other IT courses ...
  // Information Systems
  // Add IS-specific courses here
];

import '../models/course.dart';

final List<Course> mockCommonCourses = [
  Course(id: 'cpp', name: 'C++', isCommon: true),
  Course(id: 'java', name: 'Java', isCommon: true),
  Course(id: 'db', name: 'Database', isCommon: true),
  Course(id: 'coa', name: 'Computer Organization and Architecture', isCommon: true),
  Course(id: 'mpa', name: 'Microprocessor and Assembly Language', isCommon: true),
  Course(id: 'os', name: 'Operating System', isCommon: true),
  Course(id: 'net', name: 'Networking', isCommon: true),
  Course(id: 'ds', name: 'Distributed System', isCommon: true),
  Course(id: 'cloud', name: 'Cloud Computing & IoT', isCommon: true),
  Course(id: 'web', name: 'Web Development', isCommon: true),
  Course(id: 'mobile', name: 'Mobile App Development', isCommon: true),
  Course(id: 'ai', name: 'Artificial Intelligence', isCommon: true),
];

final List<Course> mockDepartmentCourses = [
  // Software Engineering
  Course(id: 'oose', name: 'Object Oriented Software Engineering', departments: ['se']),
  Course(id: 'sw_req', name: 'Software Requirement', departments: ['se']),
  Course(id: 'sw_arch', name: 'Software Architecture and Design', departments: ['se']),
  Course(id: 'sw_tools', name: 'Software Tools and Practices', departments: ['se']),

  // Computer Science
  Course(id: 'num_analysis', name: 'Numerical Analysis', departments: ['cs']),
  Course(id: 'ds_algo', name: 'Data Structures and Algorithms', departments: ['cs']),

  // Cyber Security
  Course(id: 'sw_security', name: 'Software Security', departments: ['cyb']),
  Course(id: 'net_security', name: 'Network Security', departments: ['cyb']),

  // Information Technology
  Course(id: 'embedded', name: 'Embedded Systems', departments: ['it']),
  Course(id: 'compiler', name: 'Compiler Design', departments: ['it']),

  // Information Systems
  // Add IS-specific courses here
];

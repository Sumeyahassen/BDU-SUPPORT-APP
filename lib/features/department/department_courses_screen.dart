import 'package:flutter/material.dart';

class DepartmentCoursesScreen extends StatelessWidget {
  final String departmentName;
  final IconData departmentIcon;

  const DepartmentCoursesScreen({
    super.key,
    required this.departmentName,
    required this.departmentIcon,
  });

  // Example: Replace with your real data source
  List<String> getCoursesForDepartment(String department) {
    switch (department) {
      case 'Software Engineering':
        return [
          'Software Requirements Engineering',
          'Software Design and Architecture',
          'Web Application Development',
        ];
      case 'Computer Science':
        return [
          'Artificial Intelligence',
          'Machine Learning',
          'Computer Networks',
        ];
      case 'Information Technology':
        return [
          'IT Project Management',
          'Network Administration',
          'Cloud Computing',
        ];
      case 'Information Systems':
        return [
          'Business Process Modeling',
          'Enterprise Resource Planning',
          'Information Systems Audit',
        ];
      case 'Cyber Security':
        return ['Network Security', 'Cryptography', 'Ethical Hacking'];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final courses = getCoursesForDepartment(departmentName);

    return Scaffold(
      appBar: AppBar(
        title: Text('$departmentName Courses'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: const Color(0xFFF7FAFC),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(departmentIcon, color: Colors.blue, size: 40),
                const SizedBox(width: 16),
                Text(
                  departmentName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                    height: 80,
                    child: Center(
                      child: ListTile(
                        leading: const Icon(
                          Icons.menu_book,
                          color: Colors.blue,
                          size: 32,
                        ),
                        title: Text(
                          course,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        onTap: () {
                          // TODO: Navigate to course detail screen
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

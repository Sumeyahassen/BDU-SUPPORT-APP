import 'package:flutter/material.dart';
import 'package:bdu_exam_app/features/department/department_courses_screen.dart';

class DepartmentSelectionScreen extends StatelessWidget {
  const DepartmentSelectionScreen({super.key});

  static const departments = [
    {'id': 'se', 'name': 'Software Engineering', 'icon': Icons.code},
    {'id': 'cs', 'name': 'Computer Science', 'icon': Icons.laptop},
    {'id': 'it', 'name': 'Information Technology', 'icon': Icons.people},
    {'id': 'is', 'name': 'Information Systems', 'icon': Icons.menu_book},
    {'id': 'cyb', 'name': 'Cyber Security', 'icon': Icons.shield},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Department',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: const Color(0xFFF7FAFC),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: departments.length,
        itemBuilder: (context, index) {
          final department = departments[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              height: 80,
              child: Center(
                child: ListTile(
                  leading: Icon(
                    department['icon'] as IconData,
                    color: Colors.blue,
                    size: 32,
                  ),
                  title: Text(
                    department['name'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => DepartmentCoursesScreen(
                              departmentId: department['id'] as String,
                              departmentName: department['name'] as String,
                              departmentIcon: department['icon'] as IconData,
                            ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

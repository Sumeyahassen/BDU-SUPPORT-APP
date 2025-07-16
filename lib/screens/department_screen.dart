import 'package:flutter/material.dart';
import '../../data/models/department.dart'; // Adjust path if needed
import '../../data/mock/mock_courses.dart'; // If you want to show department courses

class DepartmentScreen extends StatelessWidget {
  final Department department;
  const DepartmentScreen({Key? key, required this.department})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example: Filter courses for this department
    final departmentCourses =
        mockDepartmentCourses
            .where((course) => course.departments.contains(department.id))
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(department.name),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              department.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Department ID: ${department.id}',
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            const Text(
              'Courses:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child:
                  departmentCourses.isEmpty
                      ? const Text('No courses found for this department.')
                      : ListView.builder(
                        itemCount: departmentCourses.length,
                        itemBuilder: (context, index) {
                          final course = departmentCourses[index];
                          return ListTile(
                            title: Text(course.name),
                            subtitle: const Text('Department-Specific Course'),
                            onTap: () {
                              
                            },
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

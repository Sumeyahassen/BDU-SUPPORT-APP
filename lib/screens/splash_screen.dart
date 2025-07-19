import 'package:flutter/material.dart';
import '../../data/mock/mock_courses.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Only show common courses
    final commonCourses = mockCommonCourses;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Common Courses',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: const Color(0xFFF7FAFC),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: commonCourses.length,
        itemBuilder: (context, index) {
          final course = commonCourses[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.menu_book,
                color: Colors.blue,
                size: 32,
              ),
              title: Text(
                course.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF1E293B),
                ),
              ),
              onTap: () {
                // TODO: Navigate to course detail screen if needed
              },
            ),
          );
        },
      ),
    );
  }
}

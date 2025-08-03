import 'package:flutter/material.dart';
import '../../data/mock/mock_courses.dart';
import '../core/constants/app_colors.dart';

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
      backgroundColor: AppColors.getBackgroundColor(context),
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.getTextColor(context),
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

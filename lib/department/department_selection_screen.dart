import 'package:flutter/material.dart';
import '../../data/mock/mock_courses.dart';
import '../core/constants/app_colors.dart';

class DepartmentSelectionScreen extends StatelessWidget {
  const DepartmentSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allCourses = [...mockCommonCourses, ...mockDepartmentCourses];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: AppColors.getBackgroundColor(context),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: allCourses.length,
        itemBuilder: (context, index) {
          final course = allCourses[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              title: Text(
                course.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.getTextColor(context),
                ),
              ),
              subtitle: Text(
                mockCommonCourses.contains(course)
                    ? 'Common Course'
                    : 'Department-Specific',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.getTextSecondaryColor(context),
                ),
              ),
              onTap: () {
                // TODO: Navigate to course detail screen
              },
            ),
          );
        },
      ),
    );
  }
}

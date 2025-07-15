import 'package:flutter/material.dart';
import '../../data/mock/mock_courses.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allCourses = [...mockCommonCourses, ...mockDepartmentCourses];
    return Scaffold(
      appBar: AppBar(title: const Text('Courses'),
      backgroundColor: Colors.blue,),
      body: ListView.builder(
        itemCount: allCourses.length,
        itemBuilder: (context, index) {
          final course = allCourses[index];
          return ListTile(
            title: Text(course.name),
            subtitle: Text(
              course.isCommon ? 'Common Course' : 'Department-Specific',
            ),
            onTap: () {
              // You can navigate to a course detail screen here
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetailScreen(course: course)));
            },
          );
        },
      ),
    );
  }
}

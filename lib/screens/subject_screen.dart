import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import 'course_detail_screen.dart';

class SubjectScreen extends StatelessWidget {
  final String department;

  SubjectScreen({required this.department});

  @override
  Widget build(BuildContext context) {
    final courses = mockCourses[department] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text('$department Courses')),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return ListTile(
            title: Text(course.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CourseDetailScreen(course: course),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

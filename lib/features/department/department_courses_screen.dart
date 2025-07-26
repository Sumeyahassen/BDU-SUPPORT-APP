import 'package:flutter/material.dart';
import '../../data/models/course.dart';
import '../../data/mock/mock_courses.dart';
import '../courses/course_detail_screen.dart';

class DepartmentCoursesScreen extends StatelessWidget {
  final String departmentId;
  final String departmentName;
  final IconData departmentIcon;

  const DepartmentCoursesScreen({
    super.key,
    required this.departmentId,
    required this.departmentName,
    required this.departmentIcon,
  });

  List<Course> getCoursesForDepartment(String departmentId) {
    return mockDepartmentCourses
        .where((course) => course.departmentId == departmentId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final courses = getCoursesForDepartment(departmentId);
  

    return Scaffold(
      appBar: AppBar(
        title: Text('$departmentName Courses',style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
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
                          course.name,
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
                                  (context) =>
                                      CourseDetailScreen(course: course),
                            ),
                          );
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

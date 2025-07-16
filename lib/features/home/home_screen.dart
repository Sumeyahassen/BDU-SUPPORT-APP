import 'package:flutter/material.dart';
import '../department/department_selection_screen.dart';
import '../courses/course_list_screen.dart';
import '../about/about_screen.dart' hide DepartmentSelectionScreen;
import '../exit_exam/exit_exam_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BDU-SUPPORT-APP'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Welcome to BDU-SUPPORT-APP',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: ElevatedButton(
                onPressed:
                    () => _navigate(context, const DepartmentSelectionScreen()),
                child: const Text(
                  'Select Department',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ),
            ElevatedButton(
              onPressed: () => _navigate(context, const CourseListScreen()),
              child: const Text(
                'Common Courses',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'BDU-SUPPORT',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Just close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Select Department'),
              onTap:
                  () => _navigate(context, const DepartmentSelectionScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text('Common Courses'),
              onTap: () => _navigate(context, const CourseListScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Exit Exam'),
              onTap: () => _navigate(context, const ExitExamScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () => _navigate(context, const AboutScreen()),
            ),
          ],
        ),
      ),
    );
  }
}

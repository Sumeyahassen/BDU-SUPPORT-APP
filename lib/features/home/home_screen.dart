import 'package:flutter/material.dart';
import '../department/department_selection_screen.dart';
import '../courses/course_list_screen.dart';
import '../exit_exam/exit_exam_screen.dart';
import 'package:bdu_exam_app/features/about/about_screen.dart'
    hide DepartmentSelectionScreen;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat(); // 🔁 Loop forever

    _animation = Tween<Offset>(
      begin: const Offset(-1, 0.0), // off-screen left
      end: const Offset(1, 0.0), // off-screen right
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // always dispose controllers
    super.dispose();
  }

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BDU-SUPPORT-APP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/bdu.png"),
            const SizedBox(height: 20),
            SlideTransition(
              position: _animation,
              child: const Text(
                'Welcome to BDU-SUPPORT-APP',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: ElevatedButton(
                onPressed:
                    () => _navigate(context, const DepartmentSelectionScreen()),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                minimumSize: const Size(200,50 )),
                child: const Text(
                  'Select Department', 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
      
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _navigate(context, const CourseListScreen()),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,minimumSize: const Size(200, 50)),
              child: const Text(
                'Common Courses',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                Navigator.pop(context);
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

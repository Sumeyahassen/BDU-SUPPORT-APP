import 'package:flutter/material.dart';
import '../department/department_selection_screen.dart';
import '../courses/course_list_screen.dart';
import '../exit_exam/exit_exam_screen.dart';
import 'package:bdu_exam_app/features/about/about_screen.dart'
    hide DepartmentSelectionScreen;

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const HomeScreen({super.key, required this.toggleTheme});

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
    )..repeat();

    _animation = Tween<Offset>(
      begin: const Offset(-1, 0.0),
      end: const Offset(1, 0.0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YeCampusHub',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: isDark ? 'Light Mode' : 'Dark Mode',
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.school, color: Colors.blue),
              title: const Text('Select Department'),
              onTap: () => _navigate(context, const DepartmentSelectionScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.menu_book, color: Colors.blue),
              title: const Text('Common Courses'),
              onTap: () => _navigate(context, const CourseListScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.school, color: Colors.blue),
              title: const Text('Exit Exam'),
              onTap: () => _navigate(context, const ExitExamScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.blue),
              title: const Text('About'),
              onTap: () => _navigate(context, const AboutScreen()),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: constraints.maxWidth > 600 ? 600 : double.infinity,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // rounded corners
                      child: Image.asset(
                        "assets/images/bdu.png",
                        height: 150,
                        fit: BoxFit.cover, // optional: makes image fill nicely
                      ),
                    ),
                    const SizedBox(height: 20),
                    SlideTransition(
                      position: _animation,
                      child: Text(
                        'Welcome to YeCampusHub ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          _navigate(context, const DepartmentSelectionScreen()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text(
                        'Select Department',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          _navigate(context, const CourseListScreen()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(200, 50),
                      ),
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
            ),
          );
        },
      ),
    );
  }
}

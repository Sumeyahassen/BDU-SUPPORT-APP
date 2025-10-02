import 'package:flutter/material.dart';
import '../../data/models/course.dart';
import '../../services/api_service.dart';
import 'resourses/video_screen.dart';
import 'resourses/notes_screen.dart';
import 'resourses/books_screen.dart';
import 'resourses/exames_screen.dart';
import '../../core/constants/app_colors.dart';

class CourseDetailScreen extends StatefulWidget {
  final Course course;

  const CourseDetailScreen({required this.course, super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  List<Map<String, dynamic>> _resources = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    try {
      final data = await ApiService.getResourcesByCourseCode(widget.course.id);

      if (!mounted) return; // ✅ Check if widget is still in tree

      setState(() {
        _resources = (data as List).map((e) => e as Map<String, dynamic>).toList();
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return; // ✅ Check again before setState

      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.course.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: AppColors.getBackgroundColor(context),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!, style: const TextStyle(color: Colors.red)))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        _buildCard(
                          context: context,
                          icon: Icons.ondemand_video,
                          iconColor: Colors.blue,
                          title: 'Videos',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoScreen(
                                  resources: _resources
                                      .where((r) => r['type'] == 'video')
                                      .map((r) => r as Map<String, dynamic>)
                                      .toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        _buildCard(
                          context: context,
                          icon: Icons.note,
                          iconColor: Colors.blue,
                          title: 'Lecture Notes',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotesScreen(
                                  resources: _resources
                                      .where((r) => r['type'] == 'lecture')
                                      .map((r) => r as Map<String, dynamic>)
                                      .toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        _buildCard(
                          context: context,
                          icon: Icons.book,
                          iconColor: Colors.blue,
                          title: 'Books',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BooksScreen(
                                  resources: _resources
                                      .where((r) => r['type'] == 'book')
                                      .map((r) => r as Map<String, dynamic>)
                                      .toList(),
                                ),
                              ),
                            );
                          },
                        ),
                        _buildCard(
                          context: context,
                          icon: Icons.assignment,
                          iconColor: Colors.blue,
                          title: 'Exams',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExamsScreen(
                                  resources: _resources
                                      .where((r) => r['type'] == 'exam')
                                      .map((r) => r as Map<String, dynamic>)
                                      .toList(),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  /// 🔧 Helper method to reduce repetition
  Widget _buildCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        child: SizedBox(
          height: 80,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            leading: Icon(icon, color: iconColor),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.getTextColor(context),
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

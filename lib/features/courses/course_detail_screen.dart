import 'package:flutter/material.dart';
import '../../data/models/course.dart';
import 'resourses/video_screen.dart';
import 'resourses/notes_screen.dart';
import 'resourses/books_screen.dart';
import 'resourses/exames_screen.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  const CourseDetailScreen({required this.course, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          course.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        // ✅ Make content scrollable
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              _buildCard(
                icon: Icons.ondemand_video,
                iconColor: Colors.blue,
                title: 'Videos',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => VideoScreen(videos: course.videoUrls),
                    ),
                  );
                },
              ),
              _buildCard(
                icon: Icons.note,
                iconColor: Colors.blue,
                title: 'Lecture Notes',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => NotesScreen(notes: course.lectureNotes),
                    ),
                  );
                },
              ),
              _buildCard(
                icon: Icons.book,
                iconColor: Colors.orange,
                title: 'Books',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => BooksScreen(books: course.bookLinks),
                    ),
                  );
                },
              ),
              _buildCard(
                icon: Icons.assignment,
                iconColor: Colors.red,
                title: 'Exams',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ExamsScreen(exams: course.examLinks),
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
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

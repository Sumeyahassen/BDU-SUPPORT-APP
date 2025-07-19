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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            child: Card(
              
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                leading: const Icon(Icons.ondemand_video, color: Colors.blue),
                title: const Text('Videos',style: TextStyle(fontWeight: FontWeight.bold),),
                trailing: const Icon(Icons.arrow_forward_ios),
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
            ),
            ),
            SizedBox(
              height: 80,
              child: Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  leading: const Icon(Icons.note, color: Colors.green),
                  title: const Text('Lecture Notes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NotesScreen(notes: course.lectureNotes),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 80,
            
            child: Card(
              child: ListTile(
                 contentPadding:const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                leading: const Icon(Icons.book, color: Colors.orange),
                title: const Text('Books',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                trailing: const Icon(Icons.arrow_forward_ios),
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
            ),
            ),
            SizedBox(
              height: 80,
            
            child: Card(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                leading: const Icon(Icons.assignment, color: Colors.red),
                title: const Text('Exams',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                trailing: const Icon(Icons.arrow_forward_ios),
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
            ),
            ),
          ],
        ),
      ),
    );
  }
}

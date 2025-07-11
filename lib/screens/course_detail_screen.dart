import 'package:flutter/material.dart';
import '../models/course.dart';
import '../widgets/download_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  CourseDetailScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
        backgroundColor: Colors.blue[200],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Text('📘 Materials:', style: TextStyle(fontSize: 18)),
            ...course.materials.map(
              (material) => DownloadButton(label: material),
            ),

            SizedBox(height: 20),
            Text('📝 Past Exams:', style: TextStyle(fontSize: 18)),
            ...course.exams.map((exam) => DownloadButton(label: exam)),

            SizedBox(height: 20),
            Text('🎬 Suggested Videos:', style: TextStyle(fontSize: 18)),
            ...course.videos.map(
              (videoUrl) => ListTile(
                title: Text(videoUrl),
                trailing: Icon(Icons.play_arrow),
                onTap: () async {
                  final uri = Uri.parse(videoUrl);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Could not launch $videoUrl')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

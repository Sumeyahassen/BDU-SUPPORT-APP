import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoScreen extends StatelessWidget {
  final Map<String, String> unitVideos = {
    'Unit 1: ': '',
    'Unit 2: ': '',
    'Unit 3: ': '',
    'Unit 4: ': '',
    'Unit 5: ': '',
  };

  VideoScreen({super.key, required List<String> videos});

  // Function to open a YouTube URL
  void _launchYouTubeURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final unitList = unitVideos.entries.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Supported Videos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: unitList.length,
        itemBuilder: (context, index) {
          final unitName = unitList[index].key;
          final videoUrl = unitList[index].value;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                unitName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(
                Icons.play_circle_fill,
                color: Colors.blue,
                size: 32,
              ),
              onTap: () => _launchYouTubeURL(videoUrl),
            ),
          );
        },
      ),
    );
  }
}

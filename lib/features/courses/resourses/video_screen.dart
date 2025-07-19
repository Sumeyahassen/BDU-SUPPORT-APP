import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  final List<String> videos;

  const VideoScreen({required this.videos, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Videos',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Video ${index + 1}'),
            subtitle: Text(videos[index]),
            // You can use a video player package to play the video
          );
        },
      ),
    );
  }
}

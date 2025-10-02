import 'package:flutter/material.dart';
import '../../../utils/url_launcher_helper.dart';
import '../../../core/constants/app_colors.dart';

class VideoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> resources; // pass filtered videos
  const VideoScreen({super.key, required this.resources});

  @override
  Widget build(BuildContext context) {
    final items = resources;

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
      backgroundColor: AppColors.getBackgroundColor(context),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final r = items[index];
          final title = r['title'] ?? 'Video';
          final url = r['videoUrl'] ?? r['link'];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.getTextColor(context),
                ),
              ),
              trailing: const Icon(
                Icons.play_circle_fill,
                color: Colors.blue,
                size: 32,
              ),
              onTap: () => UrlLauncherHelper.openUrl(url),
            ),
          );
        },
      ),
    );
  }
}

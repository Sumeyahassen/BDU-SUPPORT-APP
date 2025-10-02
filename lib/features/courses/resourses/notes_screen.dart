import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../utils/url_launcher_helper.dart';

class NotesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> resources; // pass filtered notes
  const NotesScreen({Key? key, required this.resources}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lecture Notes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: AppColors.getBackgroundColor(context),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          final r = resources[index];
          final title = r['title'] ?? 'Note';
          final url = r['fileUrl'] ?? r['link'];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(color: AppColors.getTextColor(context)),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.visibility, color: Colors.green),
                    onPressed: () => UrlLauncherHelper.openUrl(url),
                  ),
                  IconButton(
                    icon: const Icon(Icons.download, color: Colors.blue),
                    onPressed: () => UrlLauncherHelper.openUrl(url),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

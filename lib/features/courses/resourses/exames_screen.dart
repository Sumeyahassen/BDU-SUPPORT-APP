import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../utils/url_launcher_helper.dart';

class ExamsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> resources; // pass filtered exams (PDFs)
  const ExamsScreen({Key? key, required this.resources}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exams',
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
          final title = r['title'] ?? 'Exam';
          final url = r['fileUrl'] ?? r['link'];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(title, style: TextStyle(color: AppColors.getTextColor(context))),
              leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
              trailing: const Icon(Icons.download),
              onTap: () => UrlLauncherHelper.openUrl(url),
            ),
          );
        },
      ),
    );
  }
}

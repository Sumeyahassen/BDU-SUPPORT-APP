import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../utils/url_launcher_helper.dart';

class BooksScreen extends StatelessWidget {
  final List<Map<String, dynamic>> resources; // pass filtered books
  const BooksScreen({super.key, required this.resources});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> juniorBooks = [
      {'title': 'Junior Book 1', 'desc': 'Basic concepts for beginners'},
      {'title': 'Junior Book 2', 'desc': 'Simple examples for new learners'},
    ];

    final List<Map<String, String>> intermediateBooks = [
      {'title': 'Intermediate Book 1', 'desc': 'Expanded topics with practice'},
      {
        'title': 'Intermediate Book 2',
        'desc': 'Deeper understanding of subjects',
      },
    ];

    final List<Map<String, String>> advancedBooks = [
      {'title': 'Advanced Book 1', 'desc': 'High-level topics with depth'},
      {'title': 'Advanced Book 2', 'desc': 'Expert knowledge and case studies'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Books',
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
        padding: const EdgeInsets.all(16),
        itemCount: resources.length,
        itemBuilder: (context, index) {
          final r = resources[index];
          final title = r['title'] ?? 'Book';
          final desc = (r['author'] ?? '') as String;
          final url = r['fileUrl'] ?? r['link'];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(title, style: TextStyle(color: AppColors.getTextColor(context))),
              subtitle: Text(desc, style: TextStyle(color: AppColors.getTextSecondaryColor(context))),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.visibility, color: Colors.blue), onPressed: () => UrlLauncherHelper.openUrl(url)),
                  IconButton(icon: const Icon(Icons.download, color: Colors.green), onPressed: () => UrlLauncherHelper.openUrl(url)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

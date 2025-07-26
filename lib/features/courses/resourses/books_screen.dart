import 'package:flutter/material.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key, required List<String> books});

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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection("📘 Junior Level", juniorBooks),
          _buildSection("📗 Intermediate Level", intermediateBooks),
          _buildSection("📙 Advanced Level", advancedBooks),
        ],
      ),
    );
  }

  Widget _buildSection(String levelTitle, List<Map<String, String>> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          levelTitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...books.map(
          (book) => Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(book['title'] ?? ''),
              subtitle: Text(book['desc'] ?? ''),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.visibility, color: Colors.blue),
                    onPressed: () {
                      // Add your View logic here
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.download, color: Colors.green),
                    onPressed: () {
                      // Add your Download logic here
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key, required List<String> notes}) : super(key: key);

  final List<String> units = const [
    'Unit 1: Introduction',
    'Unit 2: Basics',
    'Unit 3: Advanced Concepts',
    'Unit 4: Case Studies',
    'Unit 5: Final Review',
  ];

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
      body: ListView.builder(
        itemCount: units.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: ListTile(
              title: Text(units[index]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.visibility, color: Colors.green),
                    onPressed: () {
                      // TODO: Add view logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Viewing ${units[index]}')),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.download, color: Colors.blue),
                    onPressed: () {
                      // TODO: Add download logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Downloading ${units[index]}')),
                      );
                    },
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

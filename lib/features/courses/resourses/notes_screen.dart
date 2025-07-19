import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  final List<String> notes;

  const NotesScreen({required this.notes, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Lecture Notes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Note ${index + 1}'),
            subtitle: Text(notes[index]),
            // You can add logic to open/download notes
          );
        },
      ),
    );
  }
}

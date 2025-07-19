

import 'package:flutter/material.dart';

class ExamsScreen extends StatelessWidget {
  final List<String> exams;

  const ExamsScreen({required this.exams, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Exams',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
         backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Exam ${index + 1}'),
            subtitle: Text(exams[index]),
            // You can add logic to open/download exams
          );
        },
      ),
    );
  }
}

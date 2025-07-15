import 'package:flutter/material.dart';

class ExitExamScreen extends StatelessWidget {
  const ExitExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exit Exam'),
      backgroundColor: Colors.blue,),
      body: const Center(child: Text('Exit Exam Resources')),
    );
  }
}

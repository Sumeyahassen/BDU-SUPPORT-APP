import 'package:flutter/material.dart';

class ExitExamYearDepartmentScreen extends StatelessWidget {
  final int year;
  final String departmentName;
  const ExitExamYearDepartmentScreen({
    super.key,
    required this.year,
    required this.departmentName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exit Exam $year - $departmentName'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: const Color(0xFFF7FAFC),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.description, color: Colors.blue, size: 64),
              const SizedBox(height: 24),
              Text(
                'Exit Exam for $departmentName ($year)',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFF1E293B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              const Text(
                'Exam file(s) and resources will appear here.',
                style: TextStyle(fontSize: 18, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}

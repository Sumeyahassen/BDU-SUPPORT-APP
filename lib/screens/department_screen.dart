import 'package:flutter/material.dart';
import '../models/faculty.dart';
import 'subject_screen.dart';

class DepartmentScreen extends StatelessWidget {
  final Faculty faculty;

  DepartmentScreen({required this.faculty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${faculty.name} Departments')),
      body: ListView.builder(
        itemCount: faculty.departments.length,
        itemBuilder: (context, index) {
          final department = faculty.departments[index];
          return ListTile(
            title: Text(department),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SubjectScreen(department: department),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

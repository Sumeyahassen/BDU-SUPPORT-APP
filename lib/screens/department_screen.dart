import 'package:flutter/material.dart';
import '../models/faculty.dart';
import 'subject_screen.dart';

class DepartmentScreen extends StatelessWidget {
  final Faculty faculty;

  DepartmentScreen({required this.faculty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(title: Text('${faculty.name} Departments'),
      backgroundColor: Colors.blue[200],
      ),
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

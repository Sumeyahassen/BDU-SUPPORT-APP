import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import 'department_screen.dart';

class FacultyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final faculties = mockFaculties;

    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(title: Text('Select Faculty'),
        backgroundColor: Colors.blue[200],
      ),
      body: ListView.builder(
        itemCount: faculties.length,
        itemBuilder: (context, index) {
          final faculty = faculties[index];
          return ListTile(
            title: Text(faculty.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DepartmentScreen(faculty: faculty),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

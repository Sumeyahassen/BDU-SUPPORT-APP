import 'package:flutter/material.dart';
import '../../data/mock/mock_departments.dart';

class DepartmentSelectionScreen extends StatelessWidget {
  const DepartmentSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Department'),
      backgroundColor: Colors.blue,),
      body: ListView.builder(
        itemCount: mockDepartments.length,
        itemBuilder: (context, index) {
          final department = mockDepartments[index];
          return ListTile(
            title: Text(department.name),
            onTap: () {
              // You can navigate to a department-specific course list here
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}

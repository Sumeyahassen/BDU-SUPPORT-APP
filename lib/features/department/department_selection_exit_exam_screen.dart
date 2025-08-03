import 'package:flutter/material.dart';
import '../../features/exit_exam/exit_exam_year_department_screen.dart';
import '../../core/constants/app_colors.dart';

class DepartmentSelectionForExitExamScreen extends StatelessWidget {
  final int selectedYear;
  const DepartmentSelectionForExitExamScreen({
    super.key,
    required this.selectedYear,
  });

  static const departments = [
    {'id': 'se', 'name': 'Software Engineering', 'icon': Icons.code},
    {'id': 'cs', 'name': 'Computer Science', 'icon': Icons.laptop},
    {'id': 'it', 'name': 'Information Technology', 'icon': Icons.people},
    {'id': 'is', 'name': 'Information Systems', 'icon': Icons.menu_book},
    {'id': 'cyb', 'name': 'Cyber Security', 'icon': Icons.shield},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Department ($selectedYear)',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: AppColors.getBackgroundColor(context),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: departments.length,
        itemBuilder: (context, index) {
          final department = departments[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(
                department['icon'] as IconData,
                color: Colors.blue,
                size: 32,
              ),
              title: Text(
                department['name'] as String,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.getTextColor(context),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ExitExamYearDepartmentScreen(
                          year: selectedYear,
                          departmentName: department['name'] as String,
                        ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

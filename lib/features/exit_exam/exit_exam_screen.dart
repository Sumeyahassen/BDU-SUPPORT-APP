import 'package:flutter/material.dart';
import '../../features/department/department_selection_exit_exam_screen.dart';

class ExitExamScreen extends StatelessWidget {
  const ExitExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final years = [2015, 2016, 2017];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exit Exam'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: const Color(0xFFF7FAFC),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Year',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: years.length,
                itemBuilder: (context, index) {
                  final year = years[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 4,
                    ),
                    elevation: 5,
                    shadowColor: Colors.blue.withOpacity(0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    DepartmentSelectionForExitExamScreen(
                                      selectedYear: year,
                                    ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Colors.blue,
                              size: 32,
                            ),
                            const SizedBox(width: 24),
                            Text(
                              'Year $year',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

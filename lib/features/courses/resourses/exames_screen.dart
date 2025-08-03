import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class ExamsScreen extends StatelessWidget {
  final List<String> units = ['Unit 1', 'Unit 2', 'Unit 3', 'Unit 4', 'Unit 5'];
  final List<String> years = ['2015', '2016', '2017'];

  ExamsScreen({Key? key, required List<String> exams, required List examUnits})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exams',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: AppColors.getBackgroundColor(context),
      body: ListView.builder(
        itemCount: units.length,
        itemBuilder: (context, unitIndex) {
          String unit = units[unitIndex];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ExpansionTile(
                title: Text(
                  unit,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.getTextColor(context),
                  ),
                ),
                children: [
                  buildExamSection(context, 'Mid Exam', unit),
                  buildExamSection(context, 'Final Exam', unit),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildExamSection(BuildContext context, String type, String unit) {
    return Card(
      color: AppColors.getCardColor(context),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: ExpansionTile(
        title: Text(
          type,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.getTextColor(context),
          ),
        ),
        children:
            years.map((year) {
              return ListTile(
                title: Text(
                  '$year $type',
                  style: TextStyle(color: AppColors.getTextColor(context)),
                ),
                leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                trailing: const Icon(Icons.download),
                onTap: () {
                  // TODO: Add PDF viewer or download logic
                  print('Tapped on $year $type for $unit');
                },
              );
            }).toList(),
      ),
    );
  }
}

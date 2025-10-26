import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ExitExamYearDepartmentScreen extends StatefulWidget {
  final int year;
  final String departmentName;

  const ExitExamYearDepartmentScreen({
    super.key,
    required this.year,
    required this.departmentName,
  });

  @override
  State<ExitExamYearDepartmentScreen> createState() =>
      _ExitExamYearDepartmentScreenState();
}

class _ExitExamYearDepartmentScreenState
    extends State<ExitExamYearDepartmentScreen> {
  static const Color _appBarColor = Colors.blue;
  static const Color _iconColor = Colors.blue;

  bool _isLoading = true;

  // Simulated list of exam files (you can replace with real data later)
  List<String> _examFiles = [];

  @override
  void initState() {
    super.initState();
    // Simulate API call delay
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _examFiles = [
          'Exit Exam.pdf',
          
        ];
        _isLoading = false;
      });
    });
  }

  void _openExamFile(String fileName) {
    // For now, just show a SnackBar; replace with actual file open logic later
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Opening $fileName...')));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(context),
      appBar: AppBar(
        title: Text(
          'Exit Exam ${widget.year} - ${widget.departmentName}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: _appBarColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                 Icon(Icons.description, color: _iconColor, size: 64),
                  const SizedBox(height: 24),
                  Text(
                    'Exit Exam for ${widget.departmentName} (${widget.year})',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: AppColors.getTextColor(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : _examFiles.isEmpty
                      ? Text(
                        'No exam files available.',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.getTextSecondaryColor(context),
                        ),
                        textAlign: TextAlign.center,
                      )
                      : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _examFiles.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final fileName = _examFiles[index];
                          return Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              leading: const Icon(
                                Icons.file_present,
                                color: Colors.blue,
                              ),
                              title: Text(
                                fileName,
                                style: TextStyle(
                                  color: AppColors.getTextColor(context),
                                ),
                              ),
                              trailing: const Icon(Icons.open_in_new),
                              onTap: () => _openExamFile(fileName),
                              
                            ),
                          );
                        },
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

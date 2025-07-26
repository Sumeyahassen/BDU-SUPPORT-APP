import 'package:flutter/material.dart';

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
  static const Color _backgroundColor = Color(0xFFF7FAFC);
  static const Color _appBarColor = Colors.blue;
  static const Color _iconColor = Colors.blue;
  static const Color _titleColor = Color(0xFF1E293B);
  static const Color _subtitleColor = Colors.black54;

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
          'BDU Exit Exam.pdf',
          'AAU Exit Exam.pdf',
          'ASTU Exit Exam.pdf',
          'JU Exit Exam.pdf',
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
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text('Exit Exam ${widget.year} - ${widget.departmentName}',style:const TextStyle(color: Colors.white),),
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
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: _titleColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : _examFiles.isEmpty
                      ? const Text(
                        'No exam files available.',
                        style: TextStyle(fontSize: 18, color: _subtitleColor),
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
                              title: Text(fileName),
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

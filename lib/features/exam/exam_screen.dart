import 'package:flutter/material.dart';
import 'package:bdu_exam_app/services/api_service.dart';

class ExamsScreen extends StatefulWidget {
  @override
  _ExamsScreenState createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
  late Future<List<dynamic>> examsFuture;
  String? testResult;

  @override
  void initState() {
    super.initState();
    examsFuture = ApiService.getExams();
  }

  Future<void> testConnection() async {
    try {
      final exams = await ApiService.getExams();
      setState(() {
        testResult = '✅ Connected! Found ${exams.length} exams';
      });
    } catch (e) {
      setState(() {
        testResult = '❌ Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exams')),
      body: Column(
        children: [
          // Test button
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: testConnection,
              child: Text('Test Backend Connection'),
            ),
          ),
          // Test result
          if (testResult != null)
            Padding(padding: EdgeInsets.all(16), child: Text(testResult!)),
          // Existing exam list
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: examsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No exams found.'));
                }
                final exams = snapshot.data!;
                return ListView.builder(
                  itemCount: exams.length,
                  itemBuilder: (context, index) {
                    final exam = exams[index];
                    return ListTile(
                      title: Text(exam['title']),
                      subtitle: Text(exam['description']),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

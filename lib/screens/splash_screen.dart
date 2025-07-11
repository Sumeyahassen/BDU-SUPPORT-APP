import 'package:flutter/material.dart';
import 'faculty_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BDU Exam App')),
      body: Center(
        child: ElevatedButton(
          child: Text('Get Started'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FacultyScreen()),
            );
          },
        ),
      ),
    );
  }
}

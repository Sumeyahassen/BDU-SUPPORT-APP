import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() => runApp(StudentSupportApp());

class StudentSupportApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Support App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

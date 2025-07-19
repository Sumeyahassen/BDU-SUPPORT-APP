import 'package:flutter/material.dart';
import 'features/home/home_screen.dart';

void main() {
  runApp(const BduSupportApp());
}

class BduSupportApp extends StatelessWidget {
  const BduSupportApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'BDU-SUPPORT-APP',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

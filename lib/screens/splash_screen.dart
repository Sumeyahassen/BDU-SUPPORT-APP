import 'package:flutter/material.dart';
import 'faculty_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: const Text(
          "BDU Support App",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blue[200],
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Add your share logic here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            Text(
              "Select your category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(border: OutlineInputBorder()),
              hint: Text('Select Faculty / School / College'),
              value: selectedCategory,
              items:
                  [
                    'Faculty of Science',
                    'School of Business',
                    'College of Engineering',
                  ].map((item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedCategory = value;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => FacultyScreen()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

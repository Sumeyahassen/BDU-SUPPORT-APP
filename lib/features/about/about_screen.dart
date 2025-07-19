import 'package:flutter/material.dart';
import '../../data/mock/mock_departments.dart';

final Map<String, IconData> departmentIcons = {
  'Software Engineering': Icons.code,
  'Computer Science': Icons.laptop_mac,
  'Information Technology': Icons.people,
  'Information Systems': Icons.storage,
  'Cyber Security': Icons.security,
};

class DepartmentSelectionScreen extends StatelessWidget {
  const DepartmentSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Department',style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF2563EB), // Matches your blue
        leading: const BackButton(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFF7FAFC), // Light background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: mockDepartments.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 1.4,
          ),
          itemBuilder: (context, index) {
            final department = mockDepartments[index];
            final icon = departmentIcons[department.name] ?? Icons.school;
            return GestureDetector(
              onTap: () {
                // TODO: Navigate to department-specific course list
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFDBEAFE), // Light blue circle
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(18),
                      child: Icon(
                        icon,
                        size: 40,
                        color: const Color(0xFF2563EB),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      department.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ), backgroundColor: Colors.blue),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/sumeya.png",height: 150, ),
               const SizedBox(height: 20),
               const Text(
                'BDU-SUPPORT-APP',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
               const Text(
                'Version 1.0.0',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              const Text(
                'BDU-SUPPORT-APP is a comprehensive digital companion for students of Bahir Dar University\'s Computing Faculty. It centralizes access to vital learning resources, including common and department-specific course materials, exam preparations, supportive video tutorials, and project samples.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              const Divider(),
             const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.code, color: Colors.blue),
                  const SizedBox(width: 8),
                  const Text(
                    'Developed by Sumeya Hassen',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
           const SizedBox(height: 8),
            const Text(
                '© 2025 Bahir Dar University',
                style: TextStyle(fontSize: 14, color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

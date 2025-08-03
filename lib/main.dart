import 'package:flutter/material.dart';
import 'features/home/home_screen.dart';
import 'core/constants/app_colors.dart';

void main() {
  runApp(const BduSupportApp());
}

class BduSupportApp extends StatefulWidget {
  const BduSupportApp({super.key});

  @override
  State<BduSupportApp> createState() => _BduSupportAppState();
}

class _BduSupportAppState extends State<BduSupportApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BDU-SUPPORT-APP',
      themeMode: _themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.lightBackground,
        cardColor: AppColors.lightCard,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          color: AppColors.lightCard,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.lightText),
          bodyMedium: TextStyle(color: AppColors.lightText),
          titleLarge: TextStyle(color: AppColors.lightText),
          titleMedium: TextStyle(color: AppColors.lightText),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        cardColor: AppColors.darkCard,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          color: AppColors.darkCard,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.darkText),
          bodyMedium: TextStyle(color: AppColors.darkText),
          titleLarge: TextStyle(color: AppColors.darkText),
          titleMedium: TextStyle(color: AppColors.darkText),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(toggleTheme: _toggleTheme),
    );
  }
}

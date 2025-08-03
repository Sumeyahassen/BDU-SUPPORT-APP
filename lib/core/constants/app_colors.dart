import 'package:flutter/material.dart';

class AppColors {
  static const primary = Colors.blue;
  static const accent = Colors.amber;

  // Light theme colors
  static const lightBackground = Color(0xFFF7FAFC);
  static const lightSurface = Colors.white;
  static const lightText = Color(0xFF1E293B);
  static const lightTextSecondary = Colors.black54;
  static const lightCard = Colors.white;

  // Dark theme colors
  static const darkBackground = Color(0xFF121212);
  static const darkSurface = Color(0xFF1E1E1E);
  static const darkText = Colors.white;
  static const darkTextSecondary = Color(0xFFB0B0B0); // More visible gray
  static const darkCard = Color(0xFF2D2D2D);

  // Get theme-aware colors
  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackground
        : lightBackground;
  }

  static Color getSurfaceColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkSurface
        : lightSurface;
  }

  static Color getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkText
        : lightText;
  }

  static Color getTextSecondaryColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextSecondary
        : lightTextSecondary;
  }

  static Color getCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkCard
        : lightCard;
  }
}

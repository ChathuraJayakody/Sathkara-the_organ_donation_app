import 'package:flutter/material.dart';
import 'Theme.dart'; // Import LightMode & DarkMode themes

class Themeprovider with ChangeNotifier {
  ThemeData _themeData = LightMode;
  bool isDarkMode = false; // Track dark mode state

  ThemeData get themeData => _themeData;

  void toggleTheme() {
    if (isDarkMode) {
      _themeData = LightMode;
      isDarkMode = false;
    } else {
      _themeData = DarkMode;
      isDarkMode = true;
    }
    notifyListeners(); // Notify UI to update
  }
}

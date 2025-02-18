import 'package:flutter/material.dart';
import 'Theme.dart'; 

class Themeprovider with ChangeNotifier {
  ThemeData _themeData = LightMode;
  bool isDarkMode = false; 

  ThemeData get themeData => _themeData;

  void toggleTheme() {
    if (isDarkMode) {
      _themeData = LightMode;
      isDarkMode = false;
    } else {
      _themeData = DarkMode;
      isDarkMode = true;
    }
    notifyListeners(); 
  }
}

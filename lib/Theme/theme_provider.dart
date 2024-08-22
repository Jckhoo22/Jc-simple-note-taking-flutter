import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jc_notes_taking_app_flutter/Theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // I prefer dark mode first so I preset the Data to Dark Mode
  ThemeData _themeData = darkMode;

  /*

  G E T T E R S

   */

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;

  /*

  S E T T E R S

   */

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // Function for setting theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}

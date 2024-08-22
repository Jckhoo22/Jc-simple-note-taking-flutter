import 'package:flutter/material.dart';

// This file stores Light Mode
ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        surface: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.grey.shade400,
        inversePrimary: Colors.grey.shade800));

// This file stores Light Mode
ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        surface: Colors.grey.shade900,
        primary: Colors.grey.shade800,
        secondary: Colors.grey.shade700,
        inversePrimary: Colors.grey.shade300));

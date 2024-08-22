import 'package:flutter/material.dart';
import 'package:jc_notes_taking_app_flutter/Models/notes_database.dart';
import 'package:jc_notes_taking_app_flutter/Pages/home_page.dart';
import 'package:jc_notes_taking_app_flutter/Theme/theme_provider.dart';
import 'package:jc_notes_taking_app_flutter/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotesDatabase.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ThemeProvider()
        ),
        ChangeNotifierProvider(
            create: (context) => NotesDatabase()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/create_question_screen.dart';
import 'package:quiz_app/screens/create_quiz_screen.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/start_quiz_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io';

void main() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          titleTextStyle: appBarTextStyle,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            textStyle:
            const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15.0),
            shape: const RoundedRectangleBorder(borderRadius: borderRadius),
          ),
        ),
        colorScheme: colorScheme,
        useMaterial3: false,
      ),
      routes: {
        "/home": (context) => const HomeScreen(),
        "/create-quiz": (context) => const CreateQuizScreen(),
        "/create-question": (context) => const CreateQuestionScreen(),
        "/start-quiz": (context) => const StartQuizScreen(),
      },
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/components/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        title: const Text("Quiz app"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/quiz.png"),
            ElevatedButton(
              child: const Text("Let's Start!"),
              onPressed: () => Navigator.of(context).pushNamed("/start-quiz"),
            ),
          ],
        ),
      ),
    );
  }
}

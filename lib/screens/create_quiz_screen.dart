import 'package:flutter/material.dart';
import 'package:quiz_app/components/create_quiz_card.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({Key? key}) : super(key: key);

  @override
  _CreateQuizScreenState createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Quiz"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/create-question");
              },
              child: const Text(
                "+  Add new question",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          const CreatedQuizCard(),
        ],
      ),
    );
  }
}

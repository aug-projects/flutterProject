import 'package:flutter/material.dart';
import 'package:quiz_app/components/result_card.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/utilities/sqflite.dart';

class StartQuizScreen extends StatefulWidget {
  const StartQuizScreen({super.key});

  @override
  State<StartQuizScreen> createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  int currentIndex = 0;
  int score = 0;
  List<Question> questions = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  fetchQuestions() async {
    List<Question> dbQuestions = await DatabaseHelper.instance.getQuestions();
    setState(() {
      questions = dbQuestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: currentIndex >= questions.length
          ? ResultCard(score,questions.length)
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Question ${currentIndex + 1}",
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " / ${questions.length}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                questionBuilder(questions[currentIndex]),
                ...questions[currentIndex]
                    .options
                    .map((answer) => answerBuilder(
                          answer,
                          questions[currentIndex].correctAnswer,
                          questions[currentIndex].options.indexOf(answer),
                        ))
                    .toList(),
              ],
            ),
    );
  }

  Container answerBuilder(String answer, int correctAnswer, int current) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          if (correctAnswer == current) {
            setState(() {
              score += 1;
            });
          }
          setState(() {
            currentIndex++;
          });
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              answer,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  Container questionBuilder(Question quiz) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            quiz.title,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

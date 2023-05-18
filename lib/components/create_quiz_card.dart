import 'package:flutter/material.dart';
import 'package:quiz_app/components/answer_card.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/utilities/sqflite.dart';

class CreatedQuizCard extends StatefulWidget {
  const CreatedQuizCard({super.key});

  @override
  State<CreatedQuizCard> createState() => _CreatedQuizCardState();
}

class _CreatedQuizCardState extends State<CreatedQuizCard> {
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
    return Column(
        children: questions
            .map((quiz) => QuestionContainer(
                  quiz: quiz,
                  onDelete: _deleteQuestion,
                ))
            .toList());
  }

  Future<void> _deleteQuestion(int id) async {
    await DatabaseHelper.instance.deleteQuestion(id);

    fetchQuestions();

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Question deleted 🔥")));
  }
}

class QuestionContainer extends StatelessWidget {
  final Question quiz;
  final Function(int) onDelete;

  const QuestionContainer(
      {super.key, required this.quiz, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(238, 238, 238, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text(
              quiz.title,
              style: const TextStyle(fontSize: 25),
            ),
            trailing: IconButton(
              iconSize: 30,
              onPressed: () {
                _showDeleteDialog(context);
              },
              icon: const Icon(Icons.delete),
            ),
          ),
          ...quiz.options
              .map(
                (answer) => AnswerCard(
                  answer: answer,
                  isCorrect: quiz.correctAnswer == quiz.options.indexOf(answer),
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: primaryColor, fontSize: 15),
              ),
            ),
            TextButton(
              onPressed: () {
                onDelete(quiz.id);
                Navigator.of(context).pop();
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: primaryColor, fontSize: 15),
              ),
            ),
          ],
          title: const Text("Delete Question"),
          content: const Text(
            "Are you sure you want to delete this question?",
            style: TextStyle(fontSize: 20),
          ),
        );
      },
    );
  }
}

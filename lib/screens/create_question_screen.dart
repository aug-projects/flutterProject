import 'package:flutter/material.dart';
import 'package:quiz_app/components/answer_input.dart';
import 'package:quiz_app/components/correct_answer_drop_down.dart';
import 'package:quiz_app/components/question_input.dart';
import 'package:quiz_app/models/question.dart';
import 'package:sqflite/sqflite.dart';

import '../utilities/sqflite.dart';

class CreateQuestionScreen extends StatefulWidget {
  const CreateQuestionScreen({Key? key}) : super(key: key);

  @override
  _CreateQuestionScreenState createState() => _CreateQuestionScreenState();
}

class _CreateQuestionScreenState extends State<CreateQuestionScreen> {
  int dropDownValue = 1;
  TextEditingController questionController = TextEditingController();
  TextEditingController firstController = TextEditingController();
  TextEditingController secondAnswerController = TextEditingController();
  TextEditingController thirdAnswerController = TextEditingController();
  TextEditingController forthAnswerController = TextEditingController();

  @override
  void dispose() {
    questionController.dispose();
    firstController.dispose();
    secondAnswerController.dispose();
    thirdAnswerController.dispose();
    forthAnswerController.dispose();
    super.dispose();
  }

  void addQuestion(Question question) async {
    await DatabaseHelper.instance.insertQuestion(question);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add new question',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          QuestionInput(controller: questionController),
          AnswerInput(
            labelText: 'First Answer',
            circleLetter: 'A',
            circleColor: Colors.yellow,
            controller: firstController,
          ),
          AnswerInput(
            labelText: 'Second Answer',
            circleLetter: 'B',
            circleColor: Colors.green,
            controller: secondAnswerController,
          ),
          AnswerInput(
            labelText: 'Third Answer',
            circleLetter: 'C',
            circleColor: Colors.grey,
            controller: thirdAnswerController,
          ),
          AnswerInput(
            labelText: 'Fourth Answer',
            circleLetter: 'D',
            circleColor: Colors.red,
            controller: forthAnswerController,
          ),
          CorrectAnswerDropDown(
            dropDownValue: dropDownValue,
            onChanged: (val) {
              setState(() {
                dropDownValue = val ?? 0;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              final question = Question(
                title: questionController.text,
                options: [
                  firstController.text,
                  secondAnswerController.text,
                  thirdAnswerController.text,
                  forthAnswerController.text,
                ],
                correctAnswer: dropDownValue - 1,
              );

              addQuestion(question);

              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Question Added ✨")));

              Navigator.of(context).pushNamed("/create-quiz");
            },
            child: const Text(
              "Add Question",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}

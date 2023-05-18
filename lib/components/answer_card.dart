import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isCorrect;

  const AnswerCard({super.key, required this.answer, required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Card(
        color: isCorrect ? successColor : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            answer,
            style: TextStyle(fontSize: 25, color: isCorrect ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}

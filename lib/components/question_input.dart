import 'package:flutter/material.dart';

class QuestionInput extends StatelessWidget {
  final TextEditingController controller;

  const QuestionInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.all(25),
          labelText: 'Question',
          hintText: 'Enter the question',
          prefixIcon: const Icon(Icons.question_mark),
        ),
      ),
    );
  }
}

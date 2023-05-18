import 'package:flutter/material.dart';

class AnswerInput extends StatelessWidget {
  final String labelText;
  final String circleLetter;
  final Color circleColor;
  final TextEditingController controller;

  const AnswerInput({super.key,
    required this.labelText,
    required this.circleLetter,
    required this.circleColor,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: circleColor,
        radius: 25,
        child: Text(
          circleLetter,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      title: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding: const EdgeInsets.all(25),
          labelText: labelText,
        ),
      ),
    );
  }
}
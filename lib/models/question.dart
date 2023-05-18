import 'dart:math';
import 'dart:convert';

class Question {
  final int id;
  final String title;
  final List<dynamic> options;
  final int correctAnswer;

  Question({
    int? id,
    required this.title,
    required this.options,
    required this.correctAnswer,
  }) : id = id ?? Random().nextInt(1000000);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'options': jsonEncode(options),
      'correct_answer': correctAnswer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      title: map['title'],
      options: jsonDecode(map['options']), // Decode the JSON string to a list.
      correctAnswer: map['correct_answer'],
    );
  }
}

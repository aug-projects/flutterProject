import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class ResultCard extends StatelessWidget {
  final int? score;
  final int totalQuestions;

  const ResultCard(this.score, this.totalQuestions, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score! > (totalQuestions / 2) ? "Congrats" : "Oops!",
              style: const TextStyle(
                color: primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              score! > (totalQuestions / 2)
                  ? "assets/images/result.jpg"
                  : "assets/images/fail.png",
              width: 200,
              height: 200,
            ),
            Text(
              "Your Score: $score / $totalQuestions",
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              score! > (totalQuestions / 2)
                  ? "Good job!"
                  : "Sorry, better luck next time!",
              style: const TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/home");
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(230, 80),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Back to home",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../Controllers/quizzlet_controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  QuizPage({
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final quizController = QuizController();
  List<Icon> score = [];
  int correctAnswerAmount = 0;

  void checkAnswer(bool userAnswer) {
    setState(() {
      bool correctAnswer = quizController.GetCorrectAnswer();

      Icon correct = Icon(
        Icons.check,
        color: Colors.green,
      );
      Icon wrong = Icon(
        Icons.close,
        color: Colors.red,
      );

      if (userAnswer == correctAnswer) {
        score.add(correct);
        correctAnswerAmount++;
      } else {
        score.add(wrong);
      }

      bool anotherQuestion = quizController.NextQuestion();

      if (!anotherQuestion) {
        // Show completion alert
        Alert(
          context: context,
          title: "Quiz completed",
          desc: "Score: $correctAnswerAmount/${score.length}",
        ).show();

        // Restart the quiz
        quizController.RestartQuiz();
        score = [];
        correctAnswerAmount = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    quizController.GetQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                child: MaterialButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 60,
                child: MaterialButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                children: score,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}


import '../Models/question_model.dart';

class QuizController {
  List<Question> _questionBank = [
    Question(
        question:
        "AMD created the first consumer 64-bit processor.",
        answer: true),
    Question(
        question:
        "MacOS is based on Linux.",
        answer: false),
    Question(
        question: "Android versions are named in alphabetical order",
        answer: true),
    Question(
         question: "The first computer bug was formed by faulty wires.",
         answer: false),
    Question(question: "A Boolean value of &quot;0&quot; represents which of these words?",
        answer: false)
  ];

  int questionNumber = 0;

  bool NextQuestion() {
    if (questionNumber < _questionBank.length - 1) {
      questionNumber++;
      return true;
    }
    return false;
  }

  void RestartQuiz() {
    questionNumber = 0;
  }

  String GetQuestionText() {
    return _questionBank[questionNumber].question;
  }

  bool GetCorrectAnswer() {
    return _questionBank[questionNumber].answer;
  }
}
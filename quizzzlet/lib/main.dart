import 'package:flutter/material.dart';
import 'src/Views/quiz_page.dart';

void main() {
  runApp(const Quizzlet());
}
class Quizzlet extends StatelessWidget {
  const Quizzlet({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: QuizPage());
  }
}
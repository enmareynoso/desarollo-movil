import 'package:bitcoin_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CriptoApp());
}

class CriptoApp extends StatelessWidget {
  const CriptoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
            primaryColor: Colors.lightBlue,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(backgroundColor: Colors.lightBlue)),
        home: HomeScreen());
  }
}

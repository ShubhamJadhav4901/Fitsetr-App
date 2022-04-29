import 'package:fitster/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0.0,
            color: Color(0xFF495371),
          ),
          fontFamily: 'Montserrat'),
      home: OnboardingScreen(),
    );
  }
}

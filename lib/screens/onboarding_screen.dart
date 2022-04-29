import 'package:fitster/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pages = [
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(
        child: Image.asset("assets/screen1.png", height: 175.0),
      ),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(color: Colors.black, fontSize: 16),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 24)),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(
        child: Image.asset("assets/screen2.png", height: 175.0),
      ),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(color: Colors.black, fontSize: 16),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 24)),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(
        child: Image.asset("assets/screen3.png", height: 175.0),
      ),
      decoration: const PageDecoration(
          pageColor: Colors.white,
          bodyTextStyle: TextStyle(color: Colors.black, fontSize: 16),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 24)),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onSkip: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: ((context) => HomePage())));
        },
        onDone: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: ((context) => HomePage())));
        },
        showBackButton: false,
        showSkipButton: true,
        skip: const Icon(
          Icons.skip_next_rounded,
          size: 30,
          color: Colors.black,
        ),
        next: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 24,
          color: Colors.black,
        ),
        done: const Text("Done",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.blue,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}

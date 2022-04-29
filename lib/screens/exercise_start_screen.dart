// ignore_for_file: deprecated_member_use

import 'package:fitster/screens/exercise_screen.dart';
import 'package:fitster/screens/exercisehub.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExerciseStartScreen extends StatefulWidget {
  Exercises? exercises;
  ExerciseStartScreen({this.exercises});

  @override
  State<ExerciseStartScreen> createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  int seconds = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.exercises!.title.toString(),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Hero(
          tag: widget.exercises!.id.toString(),
          child: Stack(children: <Widget>[
            Image(
              image: NetworkImage(widget.exercises!.thumbnail.toString()),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff000000), Color(0x00000000)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center)),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 200,
                width: 200,
                child: SleekCircularSlider(
                  appearance: const CircularSliderAppearance(),
                  onChange: (double value) {
                    seconds = value.toInt();
                  },
                  initialValue: 30,
                  min: 10,
                  max: 60,
                  innerWidget: (v) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${v.toInt()} s",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExerciseScreen(
                                exercises: widget.exercises,
                                seconds: seconds,
                              )));
                },
                child: const Text(
                  "Start Exercise",
                  style: TextStyle(fontSize: 18),
                ),
                color: const Color(0xFF495371),
                textColor: Colors.white,
                splashColor: const Color(0x00000000),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

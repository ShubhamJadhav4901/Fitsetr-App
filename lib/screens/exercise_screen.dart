import 'dart:async';
import 'package:fitster/screens/exercisehub.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  Exercises? exercises;
  int? seconds;
  ExerciseScreen({this.exercises, this.seconds});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  bool _isCompleted = false;
  int _elapsedSeconds = 0;
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (t.tick == widget.seconds) {
        t.cancel();
        setState(() {
          _isCompleted = true;
        });
        // Navigator.of(context).pop();
      }
      setState(() {
        _elapsedSeconds = t.tick;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: <Widget>[
          Center(
              child: Image(
            image: NetworkImage(widget.exercises!.gif.toString()),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          )),
          _isCompleted != true
              ? Container(
                  padding: const EdgeInsets.only(top: 30),
                  alignment: Alignment.topCenter,
                  child: Text("${_elapsedSeconds}/${widget.seconds} s",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                )
              : Container(
                  padding: const EdgeInsets.only(top: 30),
                  alignment: Alignment.topCenter,
                  child: const Text(
                    "Workout Complete!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
          SafeArea(
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)))
        ]),
      ),
    );
  }
}

import 'dart:convert';
import 'package:fitster/screens/exercise_start_screen.dart';
import 'package:fitster/screens/exercisehub.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  final String apiUrl =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  @override
  void initState() {
    getExercises();

    super.initState();
  }

  ExerciseHub exerciseHub = ExerciseHub();

  Future<void> getExercises() async {
    var response = await http.get(Uri.parse(apiUrl));
    var decodedJson = jsonDecode(response.body);
    exerciseHub = ExerciseHub.fromJson(decodedJson);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "F I T S T E R",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
        ),
        centerTitle: true,
      ),
      body: Container(
          child: _isLoading
              ? const LinearProgressIndicator()
              : ListView(
                  children: exerciseHub.exercises!.map((e) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExerciseStartScreen(
                                      exercises: e,
                                    )));
                      },
                      child: Hero(
                        tag: e.id.toString(),
                        child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  e.thumbnail.toString(),
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                        Color(0xFF000000),
                                        Color(0x00000000)
                                      ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.center)),
                                ),
                              ),
                              Container(
                                height: 250,
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  e.title.toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              )
                            ])),
                      ),
                    );
                  }).toList(),
                )),
    );
  }
}

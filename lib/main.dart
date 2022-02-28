import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<String> habits = ["Train", "Meditate"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Habits',
        home: Scaffold(
            appBar: AppBar(
          title: Text("Habits"),
          backgroundColor: Colors.black38,
        )));
  }
}

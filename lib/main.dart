import 'package:flutter/material.dart';

import 'AddHabitRoute.dart';
import 'Constants.dart';
import 'HabitStorage.dart';
import 'body.dart';
import 'nav_bar.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Habits',
    home: MainRoute(),
  ));
}

class MainRoute extends StatelessWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits'),
        backgroundColor: Constants.appBarColor,
        leading: GestureDetector(
          onTap: () {
            openNavBar();
          },
          child: Icon(
            Icons.menu, // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: HabitBody(HabitStorage()),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  final ButtonStyle style =
  ElevatedButton.styleFrom(
    shadowColor: Colors.black38,
    textStyle: const TextStyle(fontSize: 20),
  );

  return new AlertDialog(
    title: const Center(
        child: Text("What is your goal?")
    ),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          style: style,
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddHabitRoute()),
          );},
          child: Center(child: const Text('Build a new habit')),),
        ElevatedButton(
          style: style,
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddHabitRoute()),
          );},
          child: Center(child: const Text('Lose or substitute a habit')),),
      ],
    ),
  );
}
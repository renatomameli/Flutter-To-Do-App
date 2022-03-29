import 'package:flutter/material.dart';

import '../routes/AddHabitRoute.dart';

class AddHabitDialog {
  Widget buildPopupDialog(BuildContext context) {
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
}
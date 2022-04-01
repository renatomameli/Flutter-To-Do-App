import 'package:flutter/material.dart';
import 'package:habit_changer/widgets/ElevatedButtonAddHabit.dart';

import '../routes/AddHabitRoute.dart';

class AddHabitDialog {
  Widget buildPopupDialog(BuildContext context) {
    return new AlertDialog(
        title: const Center(child: Text("What is your goal?")),
        content: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ElevatedButtonAddHabit(
                  text: "Build a habit", createPage: AddHabitRoute()),
              ElevatedButtonAddHabit(
                  text: 'Lose or substitute a habit',
                  createPage: AddHabitRoute())
            ]));
  }
}

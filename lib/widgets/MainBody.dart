import 'dart:io';

import 'package:flutter/material.dart';
import 'package:habit_changer/widgets/HeaderCard.dart';
import '../file-handling/HabitStorage.dart';
import '../model/Habit.dart';


final DateTime nowMinusTwoDays = DateTime.now().subtract(Duration(days: 2));

class HabitBody extends StatefulWidget {
  const HabitBody();


  @override
  _HabitState createState() => _HabitState();
}

class _HabitState extends State<HabitBody> {
  String _json = "";
  late HabitStorage habitStorage = new HabitStorage("");

  @override
  void initState() {
    super.initState();
    _createHabit();
    habitStorage.setFileName("fileName");
    habitStorage.readHabitJson().then((String value) {
      setState(() {
        _json = value;
      });
    });
  }

  Future<File> _createHabit() {
    setState(() {
      _json = "NEW HABIT";
    });

    return habitStorage.writeHabitJson(_json);
  }

  @override
  Widget build(BuildContext ctx) {
    return ListView(children: buildCards());
  }

  List<Card> buildCards() {
    print(_json);
    List<Card> cards = [HeaderCard()];
    return cards;
  }

  List<Icon> getTrueOrFalseIcons(Habit habit) {
    List<Icon> icons = [];
    for (int i = 0; i < 4; i++) {
      if (habit.successAtDate!.contains(nowMinusTwoDays
          .add(Duration(days: i))
          .toIso8601String()
          .substring(0, 10))) {
        icons.add(Icon(Icons.check, color: Colors.green));
      } else {
        icons.add(Icon(Icons.clear, color: Colors.red));
      }
    }
    return icons;
  }
}
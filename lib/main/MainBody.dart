import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:habit_changer/model/build/HabitBuild.dart';
import 'package:habit_changer/widgets/HeaderCard.dart';
import '../file-handling/file_manager.dart';
import '../model/Habit.dart';


final DateTime nowMinusTwoDays = DateTime.now().subtract(Duration(days: 2));

class HabitBody extends StatefulWidget {
  const HabitBody(this.fileManager);
  final FileManager fileManager;


  @override
  _HabitState createState() => _HabitState();
}

class _HabitState extends State<HabitBody> {
  String _value = "";

  @override
  void initState() {
    super.initState();
    widget.fileManager.readFile().then((String value) {
      setState(() {
        _value = value;
      });
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return ListView(children: buildCards());
  }

  List<Card> buildCards() {
    print(_value);
    List<Card> cards = [HeaderCard()];
    fromJsonToHabits(_value).forEach((element) {
      cards.add(new Card(
          child: ListTile(
              title: Text(element.name),
              trailing: Wrap(
                  spacing: 19.5, children: getTrueOrFalseIcons(element)))));
    });
    return cards;
  }

  List<HabitBuild> fromJsonToHabits(String jsonValue){
    String oldJsonString = jsonValue.replaceAll("\\", "");

    Map<String, dynamic> habitBuildMap = {};
    try{
      oldJsonString = oldJsonString.substring(1, oldJsonString.length-1);
      Map<String, dynamic> habitMap = json.decode(oldJsonString);
      habitBuildMap = habitMap["habitBuildMap"];
    } catch(e){
      print("No Habits saved or invalid JSON Format");
    }
    List<HabitBuild> habits = [];
    habitBuildMap.forEach((key, value) {
      habits.add(HabitBuild.fromJson(value));
    });
    return habits;
  }

  List<Icon> getTrueOrFalseIcons(Habit habit) {
    List<Icon> icons = [];
    for (int i = 0; i < 4; i++) {
      if (habit.successAtDate!=null && habit.successAtDate!.contains(nowMinusTwoDays
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
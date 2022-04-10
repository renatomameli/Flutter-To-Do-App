import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:habit_changer/model/build/HabitBuild.dart';
import 'package:habit_changer/widgets/HeaderCard.dart';
import '../HabitDetails.dart';
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
  List<HabitBuild> _habitBuildList = [];

  @override
  void initState() {
    super.initState();
    widget.fileManager.readFile().then((String value) {
      setState(() {
        _value = value;
        _habitBuildList = fromJsonToHabits();
      });
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return ListView(children: buildCards());
  }

  List<Widget> buildCards() {
    print(_value);
    List<Widget> cards = [HeaderCard()];
    _habitBuildList.forEach((element) {
      cards.add(
        Dismissible(
          key: ValueKey<String>(element.id!),
          child: Card(
              child: ListTile(
                  title: Text(element.name),
                  trailing: Wrap(
                      spacing: 19.5, children: getTrueOrFalseIcons(element)),
                  onLongPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HabitDetails()));
                  })),
          onDismissed: (DismissDirection direction) {
            setState(() {
              deleteHabit(element);
            });
          },
        ),
      );
    });
    return cards;
  }

  List<HabitBuild> fromJsonToHabits() {
    String oldJsonString = _value.replaceAll("\\", "");

    Map<String, dynamic> habitBuildMap = {};
    try {
      oldJsonString = oldJsonString.substring(1, oldJsonString.length - 1);

      Map<String, dynamic> habitMap = json.decode(oldJsonString);
      habitBuildMap = habitMap["habitBuildMap"];
    } catch (e) {
      print("No Habits saved or invalid JSON Format");
    }
    List<HabitBuild> habits = [];
    habitBuildMap.forEach((key, value) {
      habits.add(HabitBuild.fromJson(value));
    });
    return habits;
  }

  List<Widget> getTrueOrFalseIcons(Habit habit) {
    List<Container> icons = [];
    for (int i = 0; i < 4; i++) {
      if (habit.successAtDate != null &&
          habit.successAtDate!.contains(nowMinusTwoDays
              .add(Duration(days: i))
              .toIso8601String()
              .substring(0, 10))) {
        icons.add(Container(
            padding: const EdgeInsets.all(0.0),
            width: 30.0,
            child:
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.green,
              ),
              padding: EdgeInsets.zero,
              onPressed: () {},
            ))
        );
      } else {
        icons.add(Container(
            padding: const EdgeInsets.all(0.0),
            width: 24.0,
            child: IconButton(icon: Icon(Icons.clear, color: Colors.red),
          padding: EdgeInsets.zero,
          onPressed: () {  },)));
      }
    }
    return icons;
  }

  void deleteHabit(HabitBuild element) {
    _habitBuildList.removeAt(_habitBuildList.indexOf(element));

    String oldJsonString = _value.replaceAll("\\", "");

    Map<String, dynamic> habitBuildMap = {};
    try {
      oldJsonString = oldJsonString.substring(1, oldJsonString.length - 1);
      Map<String, dynamic> habitMap = json.decode(oldJsonString);
      habitBuildMap = habitMap["habitBuildMap"];
      habitBuildMap.remove(element.id);
    } catch (e) {
      print("No Habits saved or invalid JSON Format");
    }

    Map<String, dynamic> newHabitMap = {};
    newHabitMap.putIfAbsent("habitBuildMap", () => habitBuildMap);

    String newJson = jsonEncode(newHabitMap);
    _value = newJson;
    widget.fileManager.writeFile(json.encode(newJson));
  }

  void changeSuccessAtDate(String id, int position){
    setState(() {

    });
  }
}

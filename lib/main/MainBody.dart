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
  Map<String, HabitBuild> _habitBuildMap = {};

  @override
  void initState() {
    super.initState();
    widget.fileManager.readFile().then((String value) {
      setState(() {
        _value = value;
        _habitBuildMap = fromJsonToHabits();
      });
    });
  }

  @override
  Widget build(BuildContext ctx) {
    _habitBuildMap = _habitBuildMap;
    return ListView(children: buildCards());
  }

  List<Widget> buildCards() {
    print(_value);
    List<Widget> cards = [HeaderCard()];
    _habitBuildMap.forEach((key, habitBuild) {
      cards.add(
        Dismissible(
          key: ValueKey<String>(key),
          child: Card(
              child: ListTile(
                  title: Text(habitBuild.name),
                  trailing: Wrap(
                      spacing: 19.5, children: getTrueOrFalseIcons(habitBuild)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HabitDetails()));
                  },
                onLongPress: () {
                    print("HI");
                },
              )),
          onDismissed: (DismissDirection direction) {
            setState(() {
              deleteHabit(habitBuild);
            });
          },
        ),
      );
    });
    return cards;
  }

  Map<String, HabitBuild> fromJsonToHabits() {
    String oldJsonString = _value.replaceAll("\\", "");

    Map<String, dynamic> habitBuildMap = {};
    try {
      oldJsonString = oldJsonString.substring(1, oldJsonString.length - 1);

      Map<String, dynamic> habitMap = json.decode(oldJsonString);
      habitBuildMap = habitMap["habitBuildMap"];
    } catch (e) {
      print("No Habits saved or invalid JSON Format");
    }
    Map<String, HabitBuild> newHabitBuildMap = {};
    habitBuildMap.forEach((key, value) {
      newHabitBuildMap.putIfAbsent(key, () => HabitBuild.fromJson(value));
    });
    return newHabitBuildMap;
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
            width: 24.0,
            child:
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.green,
              ),
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  changeSuccessAtDate(habit.id!, i, false);
                });
              },
            ))
        );
      } else {
        icons.add(Container(
            padding: const EdgeInsets.all(0.0),
            width: 24.0,
            child: IconButton(icon: Icon(Icons.clear, color: Colors.red),
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  changeSuccessAtDate(habit.id!, i, true);
                });
              },)));
      }
    }
    return icons;
  }

  void deleteHabit(HabitBuild element) {
    _habitBuildMap.remove(element.id);

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

    String newJson = json.encode(newHabitMap);
    _value = json.encode(newJson);
    widget.fileManager.writeFile(json.encode(newJson));
  }

  void changeSuccessAtDate(String id, int position, bool activate) {
    String oldJsonString = _value.replaceAll("\\", "");
    oldJsonString = oldJsonString.substring(1, oldJsonString.length - 1);

    Map<String, dynamic> habitMap = json.decode(oldJsonString);
    Map<String, dynamic> habitBuildMap = habitMap["habitBuildMap"];
    Map<String, HabitBuild> newHabitBuildMap = {};
    habitBuildMap.forEach((key, value) {
      newHabitBuildMap.putIfAbsent(key, () => HabitBuild.fromJson(value));
    });

    String value = nowMinusTwoDays.add(Duration(days: position))
        .toIso8601String()
        .substring(0, 10);
    if(activate==true){
      if (newHabitBuildMap[id]?.successAtDate != null) {
        newHabitBuildMap[id]?.successAtDate!.add(value);
      } else {
        newHabitBuildMap[id]?.setSuccessAtDate([value]);
      }
    } else {
      if (newHabitBuildMap[id]?.successAtDate != null) {
        newHabitBuildMap[id]!.successAtDate!.remove(value);
      }
    }


    Map<String, dynamic> newHabitMap = {};
    newHabitMap.putIfAbsent("habitBuildMap", () => newHabitBuildMap);

    _habitBuildMap = newHabitBuildMap;
    String newJson = json.encode(newHabitMap);
    _value = json.encode(newJson);
    widget.fileManager.writeFile(json.encode(newJson));
  }


}

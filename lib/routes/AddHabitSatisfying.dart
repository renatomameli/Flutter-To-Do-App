import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:habit_changer/file-handling/file_manager.dart';
import 'package:habit_changer/main/main.dart';
import 'package:habit_changer/model/build/HabitBuild.dart';
import 'package:habit_changer/model/build/HabitBuildSatisfying.dart';
import 'package:habit_changer/widgets/PaddingStandard.dart';

class AddHabitSatisfyingRoute extends StatelessWidget {
  final HabitBuild habitBuild;

  const AddHabitSatisfyingRoute(
      {Key? key, required this.habitBuild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
          appBar: AppBar(
              title: const Text('Make the habit satisfying'),
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: _MyStatefulWidget(
            habitBuild: habitBuild, fileManager: FileManager(),
          ),
        )
    );
  }
}

class _MyStatefulWidget extends StatefulWidget {
  const _MyStatefulWidget({Key? key, required this.habitBuild, required this.fileManager})
      : super(key: key);
  final HabitBuild habitBuild;
  final FileManager fileManager;

  @override
  State<_MyStatefulWidget> createState() => _MyForm(habitBuild);
}

class _MyForm extends State<_MyStatefulWidget> {
  _MyForm(this.habitBuild);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final HabitBuild habitBuild;
  final HabitBuildSatisfying habitBuildSatisfying = new HabitBuildSatisfying();
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

  Future<File> saveFile(String value) {
    setState(() {
      _value = value;
    });
    return widget.fileManager.writeFile(_value);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PaddingStandard(
                  child: Text("1. Use a reward as reinforcement:")),
              PaddingStandard(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'e.g. Eat a cookie',
                  ),
                  validator: (String? value) {
                    habitBuildSatisfying.setReward(value!);
                    return null;
                  },
                ),
              ),
              PaddingStandard(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      habitBuild.setHabitBuildSatisfying(habitBuildSatisfying);
                      saveNewHabitBuild();
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen(fileManager: FileManager())));
                    }
                  },
                  child: const Text('Continue'),
                ),
              ),
            ]));
  }

  void saveNewHabitBuild() {
    String oldJsonString = _value.replaceAll("\\", "");


    Map<String, dynamic> habitBuildMap = {};
    try{
      oldJsonString = oldJsonString.substring(1, oldJsonString.length-1);
      Map<String, dynamic> habitMap = json.decode(oldJsonString);
      habitBuildMap = habitMap["habitBuildMap"];
    } catch(e){
      print("No Habits saved or invalid JSON Format");
    }

    String newId = _generateId(habitBuildMap);
    habitBuild.setId(newId);
    habitBuildMap.putIfAbsent(newId, () => habitBuild);

    Map<String, dynamic> newHabitMap = {};
    newHabitMap.putIfAbsent("habitBuildMap", () => habitBuildMap);
    String jsonString = json.encode(newHabitMap);
    saveFile(json.encode(jsonString));
  }

  String _generateId(Map<String, dynamic> habitMap){
    List<String> keys = habitMap.keys.toList();
    return keys.length.toString();
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:habit_changer/file-handling/file_controller.dart';
import 'package:habit_changer/model/build/HabitBuild.dart';
import 'package:habit_changer/model/build/HabitBuildSatisfying.dart';
import 'package:habit_changer/widgets/PaddingStandard.dart';
import 'package:provider/provider.dart';

import '../main/main.dart';
import 'StoreHabit.dart';

class AddHabitSatisfyingRoute extends StatelessWidget {
  final HabitBuild habitBuild;

  const AddHabitSatisfyingRoute(
      {Key? key, required this.habitBuild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => FileController())],
        child: MaterialApp(home: Scaffold(
          appBar: AppBar(
              title: const Text('Make the habit satisfying'),
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: _MyStatefulWidget(
            habitBuild: habitBuild,
          ),
        ))
    );
  }
}

class _MyStatefulWidget extends StatefulWidget {
  const _MyStatefulWidget({Key? key, required this.habitBuild})
      : super(key: key);
  final HabitBuild habitBuild;

  @override
  State<_MyStatefulWidget> createState() => _MyForm(habitBuild);
}

class _MyForm extends State<_MyStatefulWidget> {
  _MyForm(this.habitBuild);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final HabitBuild habitBuild;
  final HabitBuildSatisfying habitBuildSatisfying = new HabitBuildSatisfying();

  @override
  Widget build(BuildContext context) {
    context.read<FileController>().readText();
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
                      _formKey.currentContext;
                      habitBuild.setHabitBuildSatisfying(habitBuildSatisfying);
                      StoreHabit.saveHabitBuild(habitBuild);
                      JsonEncoder encoder = new JsonEncoder.withIndent('  ');
                      String json = encoder.convert(habitBuild.toJson());
                      context.read<FileController>().writeText(json);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    }
                  },
                  child: const Text('Continue'),
                ),
              ),
            ]));
  }
}

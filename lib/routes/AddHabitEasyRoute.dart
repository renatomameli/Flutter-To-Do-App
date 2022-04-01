import 'package:flutter/material.dart';
import 'package:habit_changer/model/build/HabitBuild.dart';
import 'package:habit_changer/model/build/HabitBuildEasy.dart';
import 'package:habit_changer/widgets/PaddingStandard.dart';

import 'AddHabitSatisfying.dart';

class AddHabitEasyRoute extends StatelessWidget {
  final HabitBuild habitBuild;

  const AddHabitEasyRoute({Key? key, required this.habitBuild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Make the habit easy'),
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: SingleChildScrollView(
          child: _MyStatefulWidget(
            habitBuild: habitBuild,
          ),
        ));
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
  final HabitBuildEasy habitBuildEasy = new HabitBuildEasy();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          PaddingStandard(child: Text("1. Reduce effort:")),
          PaddingStandard(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'e.g. Put weights in front of the bed',
              ),
              validator: (String? value) {
                habitBuildEasy.setEffort(value!);
                return null;
              },
            ),
          ),
          PaddingStandard(child: Text("2. Use technical solutions:")),
          PaddingStandard(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'e.g. Use a workout App',
              ),
              validator: (String? value) {
                habitBuildEasy.setTechnical(value!);
                return null;
              },
            ),
          ),
          PaddingStandard(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentContext;
                  habitBuild.setHabitBuildEasy(habitBuildEasy);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddHabitSatisfyingRoute(
                              habitBuild: habitBuild)));
                }
              },
              child: const Text('Continue'),
            ),
          ),
        ]));
  }
}

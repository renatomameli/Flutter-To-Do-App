import 'package:flutter/material.dart';
import 'package:habit_changer/model/build/HabitBuild.dart';
import 'package:habit_changer/model/build/HabitBuildAttractive.dart';
import 'package:habit_changer/widgets/PaddingStandard.dart';

import 'AddHabitEasyRoute.dart';

class AddHabitAttractiveRoute extends StatelessWidget {
  final HabitBuild habitBuild;

  const AddHabitAttractiveRoute({Key? key, required this.habitBuild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Make the habit attractive'),
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: SingleChildScrollView(
            child: _MyStatefulWidget(
          habitBuild: habitBuild,
        )));
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
  HabitBuildAttractive habitBuildAttractive = new HabitBuildAttractive();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PaddingStandard(
                  child: Text("1. Recognize advantages of the new habit")),
              PaddingStandard(
                  child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                validator: (String? value) {
                  habitBuildAttractive.setAdvantages(value!);
                  return null;
                },
              )),
              PaddingStandard(
                  child: Text(
                      "2. Create environment where it is easy to build a habit")),
              PaddingStandard(
                  child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                validator: (String? value) {
                  habitBuildAttractive.setEnvironment(value!);
                  return null;
                },
              )),
              PaddingStandard(
                  child: Text("3. Do something enjoyable before habit")),
              PaddingStandard(
                  child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                validator: (String? value) {
                  habitBuildAttractive.setEnjoyable(value!);
                  return null;
                },
              )),
              PaddingStandard(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentContext;
                      habitBuild.setHabitBuildAttractive(habitBuildAttractive);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddHabitEasyRoute(habitBuild: habitBuild)));
                    }
                  },
                  child: const Text('Continue'),
                ),
              ),
            ]));
  }
}

import 'package:flutter/material.dart';
import 'package:habit_changer/widgets/PaddingStandard.dart';

import 'AddHabitEasyRoute.dart';

class AddHabitAttractiveRoute extends StatelessWidget {
  final Map<String, String> newHabitObviousFormMap;
  final Map<String, String> triggerStimulusMap;

  const AddHabitAttractiveRoute(
      {Key? key,
      required this.newHabitObviousFormMap,
      required this.triggerStimulusMap})
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
          newHabitObviousFormMap: newHabitObviousFormMap,
        )));
  }
}

class _MyStatefulWidget extends StatefulWidget {
  const _MyStatefulWidget({Key? key, required this.newHabitObviousFormMap})
      : super(key: key);
  final Map<String, String> newHabitObviousFormMap;

  @override
  State<_MyStatefulWidget> createState() => _MyForm(newHabitObviousFormMap);
}

class _MyForm extends State<_MyStatefulWidget> {
  _MyForm(this.newHabitFormMap);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> newHabitFormMap;
  final Map<String, String> newHabitAttractiveFormMap = {};

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          PaddingStandard(
              child: Text("1. Recognize advantages of the new habit")),
          PaddingStandard(
              child: TextFormField(
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 5,
            validator: (String? value) {
              newHabitAttractiveFormMap.putIfAbsent("advantages", () => value!);
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
              newHabitAttractiveFormMap.putIfAbsent("environment", () => value!);
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
              newHabitAttractiveFormMap.putIfAbsent("enjoyable", () => value!);
              return null;
            },
          )),
          PaddingStandard(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentContext;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddHabitEasyRoute(
                              newHabitAttractiveFormMap:
                                  newHabitAttractiveFormMap)));
                }
              },
              child: const Text('Continue'),
            ),
          ),
        ]));
  }
}

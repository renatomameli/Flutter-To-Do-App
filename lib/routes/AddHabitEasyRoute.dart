import 'package:flutter/material.dart';
import 'package:habit_changer/widgets/PaddingStandard.dart';

import 'AddHabitSatisfying.dart';

class AddHabitEasyRoute extends StatelessWidget {
  final Map<String, String> newHabitAttractiveFormMap;

  const AddHabitEasyRoute({Key? key, required this.newHabitAttractiveFormMap})
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
            newHabitAttractiveFormMap: newHabitAttractiveFormMap,
          ),
        ));
  }
}

class _MyStatefulWidget extends StatefulWidget {
  const _MyStatefulWidget({Key? key, required this.newHabitAttractiveFormMap})
      : super(key: key);
  final Map<String, String> newHabitAttractiveFormMap;

  @override
  State<_MyStatefulWidget> createState() => _MyForm(newHabitAttractiveFormMap);
}

class _MyForm extends State<_MyStatefulWidget> {
  _MyForm(this.newHabitAttractiveFormMap);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> newHabitAttractiveFormMap;
  final Map<String, String> newHabitEasyFormMap = {};

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
                newHabitEasyFormMap.putIfAbsent("reduceEffort", () => value!);
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
                newHabitEasyFormMap.putIfAbsent("technicalSolutions", () => value!);
                return null;
              },
            ),
          ),
          PaddingStandard(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentContext;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddHabitSatisfyingRoute(
                              newHabitAttractiveFormMap: newHabitEasyFormMap)));
                }
              },
              child: const Text('Continue'),
            ),
          ),
        ]));
  }
}

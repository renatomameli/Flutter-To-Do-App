import 'package:flutter/material.dart';
import 'package:habit_changer/widgets/PaddingStandard.dart';

import '../main/main.dart';

class AddHabitSatisfyingRoute extends StatelessWidget {
  final Map<String, String> newHabitAttractiveFormMap;

  const AddHabitSatisfyingRoute(
      {Key? key, required this.newHabitAttractiveFormMap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Make the habit satisfying'),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: _MyStatefulWidget(
        newHabitAttractiveFormMap: newHabitAttractiveFormMap,
      ),
    );
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
  _MyForm(this.newHabitFormMap);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> newHabitFormMap;
  final Map<String, String> newHabitSatisfyingFormMap = {};

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
                    newHabitSatisfyingFormMap.putIfAbsent("reduceEffort", () => value!);
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
                          MaterialPageRoute(builder: (context) => MainRoute()));
                    }
                  },
                  child: const Text('Continue'),
                ),
              ),
            ]));
  }
}

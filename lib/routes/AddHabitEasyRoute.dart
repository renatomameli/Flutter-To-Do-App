import 'package:flutter/material.dart';

import 'AddHabitSatisfying.dart';

class AddHabitEasyRoute extends StatelessWidget {
  final Map<String, String> newHabitAttractiveFormMap;

  const AddHabitEasyRoute(
      {Key? key, required this.newHabitAttractiveFormMap})
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
  final Map<String, String> newHabitEasyFormMap = {};

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Text("1. Implementation Intention:")),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentContext;
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddHabitSatisfyingRoute(newHabitAttractiveFormMap: newHabitEasyFormMap)));
                    }
                  },
                  child: const Text('Continue'),
                ),
              ),
            ]));
  }
}

import 'package:flutter/material.dart';
import 'package:habit_changer/routes/AddHabitAttractiveRoute.dart';
import 'package:habit_changer/utils/Constants.dart';
import 'package:habit_changer/widgets/PaddingStandard.dart';

class AddHabitObviousRoute extends StatelessWidget {
  final Map<String, String> newHabitFormMap;

  const AddHabitObviousRoute({Key? key, required this.newHabitFormMap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Make the habit obvious'),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: _MyStatefulWidget(
        newHabitFormMap: newHabitFormMap,
      ),
    );
  }
}

class _MyStatefulWidget extends StatefulWidget {
  const _MyStatefulWidget({Key? key, required this.newHabitFormMap})
      : super(key: key);
  final Map<String, String> newHabitFormMap;

  @override
  State<_MyStatefulWidget> createState() => _MyForm(newHabitFormMap);
}

class _MyForm extends State<_MyStatefulWidget> {
  _MyForm(this.newHabitFormMap);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> newHabitFormMap;
  final Map<String, String> newHabitObviousFormMap = {};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PaddingStandard(
              child: Text("1. Implementation Intention:")),
          PaddingStandard(
              child: Row(
                children: [
                  Text("I will make the habit: \"" +
                      newHabitFormMap["name"].toString() +
                      "\" at "),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: '01:00',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        newHabitObviousFormMap.putIfAbsent("time", () => value);
                        return null;
                      },
                    ),
                  ),
                ],
              )),
          PaddingStandard(
              child: Row(
                children: [
                  Text("in "),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'my bathroom',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        newHabitObviousFormMap.putIfAbsent(
                            "habitAfter", () => value);
                        return null;
                      },
                    ),
                  ),
                ],
              )),
          PaddingStandard(
              child: Text("2. Habitual coupling:")),
          PaddingStandard(
              child: Row(
                children: [
                  Text("After the habit: \"" +
                      newHabitFormMap["name"].toString() +
                      "\" I do the habit: "),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'e.g. Meditation',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              )),

          /*
           * Continue
           */
          PaddingStandard(
              child: Text("3. Make triggers obvious:")),
          Container(),
          PaddingStandard(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentContext;
                   Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => AddHabitAttractiveRoute(newHabitObviousFormMap: newHabitObviousFormMap)));
                }
              },
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Text("1. Implementation Intention:")),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text("I will make the habit: \"" +
                      newHabitFormMap["name"].toString() + "\" at "),
                  Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: '01:00',
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
          Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child:
              Row(children: [
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
                      return null;
                    },
                  ),
                ),
          ],)

          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentContext;
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => const AddHabitObviousRoute()));
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

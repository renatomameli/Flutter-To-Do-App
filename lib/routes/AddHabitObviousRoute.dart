import 'package:flutter/material.dart';
import 'package:habit_changer/routes/AddHabitAttractiveRoute.dart';
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
        body: SingleChildScrollView(
          child: _MyStatefulWidget(
            newHabitFormMap: newHabitFormMap,
          ),
        ));
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

  Map<String, String> triggerStimulusMap = {};

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> newHabitFormMap;
  final Map<String, String> newHabitObviousFormMap = {};

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PaddingStandard(child: Text("1. Implementation Intention:")),
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
          PaddingStandard(child: Text("2. Habitual coupling:")),
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
          PaddingStandard(child: Text("3. Make triggers obvious:")),
          Container(
            child: Column(
              children: _loadCards(),
            ),
          ),

          /*
           * Continue
           */
          PaddingStandard(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentContext;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddHabitAttractiveRoute(
                                newHabitObviousFormMap: newHabitObviousFormMap,
                                triggerStimulusMap: triggerStimulusMap,
                              )));
                }
              },
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _loadCards() {
    List<Widget> cards = [
      GestureDetector(
          onTap: () => _addCard(),
          child: Card(
              child: ListTile(
                  title: Text("Add Card"),
                  trailing: Wrap(spacing: 19.5, children: [Icon(Icons.add)])))),
    ];
    triggerStimulusMap.forEach((key, value) {
      cards.add(new Card(child: ListTile(title: Text(value))));
    });
    return cards;
  }

  void _addCard() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Add ",
              ),
            ),
            actions: [
              TextButton(
                child: Text("Save trigger stimulus"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  _save();
                },
              )
            ],
          );
        });
  }

  _save() {
    if (_controller.text.length > 0) {
      setState(() {
        triggerStimulusMap.putIfAbsent(
            _controller.text, () => _controller.text);
      });
    }
  }
}

import 'package:flutter/material.dart';

class AddHabitObviousRoute extends StatelessWidget{
  final Map<String, String> newHabitFormMap;
  const AddHabitObviousRoute({Key? key, required this.newHabitFormMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make the habit obvious'),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          )
      ),
      body: const _MyStatefulWidget(),
    );
  }
}

class _MyStatefulWidget extends StatefulWidget {
  const _MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<_MyStatefulWidget> createState() => _MyForm();
}

class _MyForm extends State<_MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Question',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Notes (optional)',
              ),
              validator: (String? value) {
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
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


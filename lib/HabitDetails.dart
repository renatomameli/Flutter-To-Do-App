import 'package:flutter/material.dart';

class HabitDetails extends StatelessWidget {

  const HabitDetails({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Habit details'),
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: SingleChildScrollView(
          child: _MyStatefulWidget(
          ),
        ));
  }
}

class _MyStatefulWidget extends StatefulWidget {
  const _MyStatefulWidget({Key? key})
      : super(key: key);

  @override
  State<_MyStatefulWidget> createState() => _MyForm();
}

class _MyForm extends State<_MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return Form(child: Text(""),

    );
  }

}

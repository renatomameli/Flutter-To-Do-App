
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddHabitRoute extends StatelessWidget {
  const AddHabitRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text('New Habit'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_changer/Constants.dart';

class AddHabitRoute extends StatelessWidget {
  const AddHabitRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: const Text('New Habit'),
                backgroundColor: Constants.appBarColor,
                leading: BackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            body: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'e.g. Meditate',
                    labelText: 'Name',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: Text(
                    "1. Implementation intention",
                    style: TextStyle(
                      fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ),
              ],
            )));
  }
}

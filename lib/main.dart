import 'package:flutter/material.dart';
import 'package:habit_changer/AddHabitDialog.dart';

import 'utils/Constants.dart';
import 'HabitStorage.dart';
import 'MainBody.dart';
import 'nav_bar.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Habits',
    home: MainRoute(),
  ));
}

class MainRoute extends StatelessWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits'),
        backgroundColor: Constants.appBarColor,
        leading: GestureDetector(
          onTap: () {
            openNavBar();
          },
          child: Icon(
            Icons.menu, // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AddHabitDialog().buildPopupDialog(context),
                );
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: HabitBody(HabitStorage()),
    );
  }
}


import 'package:flutter/material.dart';

import 'AddHabitRoute.dart';
import 'HabitStorage.dart';
import 'body.dart';
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
        backgroundColor: Colors.black38,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddHabitRoute()),
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
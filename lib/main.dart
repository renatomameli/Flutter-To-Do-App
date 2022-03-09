import 'package:flutter/material.dart';
import 'package:habit_changer/add_habit.dart';
import 'package:habit_changer/body.dart';
import 'nav_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<String> habits = ["Train", "Meditate"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Habits',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Habits"),
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
                      addHabit();
                    },
                    child: Icon(
                        Icons.add
                    ),
                  )
              ),
            ],
          ),
          body: buildBody(),
        ));
  }
}

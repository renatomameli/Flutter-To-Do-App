import 'package:flutter/material.dart';
import 'package:habit_changer/AddHabitRoute.dart';
import 'package:habit_changer/body.dart';
import 'HabitStorage.dart';
import 'nav_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        ));
  }
}

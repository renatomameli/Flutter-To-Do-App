import 'package:flutter/material.dart';
import 'package:habit_changer/file-handling/file_manager.dart';
import 'package:habit_changer/main/MainBody.dart';

import 'AddHabitDialog.dart';
import 'nav_bar.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Habits',
      home: HomeScreen(fileManager: FileManager()),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.fileManager}) : super(key: key);

  final FileManager fileManager;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _value = "";

  @override
  void initState() {
    super.initState();
    widget.fileManager.readFile().then((String value) {
      setState(() {
        _value = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits'),
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
                  builder: (BuildContext context) =>
                      AddHabitDialog().buildPopupDialog(context),
                );
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Center(child: HabitBody(FileManager())),
    );
  }
}

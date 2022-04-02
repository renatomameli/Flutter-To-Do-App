import 'package:flutter/material.dart';
import 'package:habit_changer/file-handling/file_controller.dart';
import 'package:habit_changer/main/AddHabitDialog.dart';
import 'package:provider/provider.dart';

import '../utils/Constants.dart';
import 'MainBody.dart';
import 'nav_bar.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => FileController())],
    child: MaterialApp(home: MyApp())
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<FileController>().readText();
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
                  builder: (BuildContext context) =>
                      AddHabitDialog().buildPopupDialog(context),
                );
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Container(
        child:  Text(context.select((FileController controller) {
          if (controller.text==null){
            return "";
          }
          return controller.text!;
        }
        )),
      ),
    );
  }
}

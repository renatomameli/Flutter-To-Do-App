import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'habit.dart';

List<Habit> habits = [Habit("Meditate", {'2022-03-01': true, '2022-03-09': true})];
final DateTime now = DateTime.now();
List<String> days = ["Sa", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa", "Su", "Mo"];
List<Card> habitCards = [new Card()];

Widget buildBody(){
  return ListView(
    children: <Widget>[
      Card(child: ListTile(
        trailing: Wrap(
          spacing: 27, // space between two icons
          children: <Widget>[
            Text(getFourRelevantTextDays().first), // icon-1
            Text(getFourRelevantTextDays()[1]), // icon-2
            Text(getFourRelevantTextDays()[2]), // icon-1
            Text(getFourRelevantTextDays().last), // icon-2
          ],
        ),
      ),
      ),
      Card(child: ListTile(
        title: Text(habits[0].name),
        trailing: Wrap(
          spacing: 19.5,
          children: <Widget>[
            Icon(Icons.check),
            Icon(Icons.check),
            Icon(Icons.check),
            Icon(Icons.check),
          ],
        ),
      ))
    ]
  );
}

List<String> getFourRelevantTextDays(){
  int positionInDaysList = now.weekday + 2;
  List <String> a = days.getRange(positionInDaysList -3, positionInDaysList + 1).toList();
  return a;
}




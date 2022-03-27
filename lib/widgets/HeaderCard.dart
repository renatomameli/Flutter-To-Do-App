import 'package:flutter/material.dart';

List<String> days = ["Sa", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa", "Su", "Mo"];
final DateTime now = DateTime.now();

class HeaderCard extends Card{
  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(
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
    );
  }

  List<String> getFourRelevantTextDays(){
    int positionInDaysList = now.weekday + 2;
    return days.getRange(positionInDaysList -3, positionInDaysList + 1).toList();
  }
}
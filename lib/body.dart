import 'package:flutter/material.dart';
import 'package:habit_changer/HeaderCard.dart';
import 'package:habit_changer/file_importer.dart';
import 'habit.dart';

List<Habit> dummyHabits = [Habit(1, "Meditate", "Be careful", ['2022-03-01', '2022-03-09']),
  Habit(2, "Train", "Be careful", ['2022-03-08', '2022-03-09']),
  Habit(3, "Cold Shower", "Be careful", []),
  Habit(4, "Yoga" , "Be careful", ['2022-03-08', '2022-03-09', '2022-03-10', '2022-03-07', '2022-03-11']),
];

final DateTime nowMinusTwoDays = DateTime.now().subtract(Duration(days:2));

Widget buildBody() {
    return ListView(
    children: buildCards()
  );
}

List<Card> buildCards(){
  List<Card> cards = [HeaderCard()];

  dummyHabits.forEach((element) {
    cards.add(
      new Card(child: ListTile(
        title: Text(element.name),
        trailing: Wrap(
          spacing: 19.5,
          children: getTrueOrFalseIcons(element)
        )
      )
      )
    );
  });
  return cards;
}

List<Icon> getTrueOrFalseIcons(Habit habit){
  List<Icon> icons = [];
  for(int i=0; i<4; i++){
    if(habit.successAtDate.contains(nowMinusTwoDays.add(Duration(days: i)).toIso8601String().substring(0,10))){
      icons.add(Icon(Icons.check, color: Colors.green,));
    } else {
      icons.add(Icon(Icons.clear, color: Colors.red));
    }
  }
  return icons;
}


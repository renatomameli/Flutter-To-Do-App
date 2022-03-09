import 'package:flutter/material.dart';
import 'package:habit_changer/HeaderCard.dart';
import 'habit.dart';

List<Habit> dummyHabits = [Habit("Meditate", {'2022-03-01': true, '2022-03-09': true}),
  Habit("Train", {'2022-03-08': true, '2022-03-09': true}),
  Habit("Cold Shower", {}),
  Habit("Yoga", {'2022-03-08': true, '2022-03-09': true, '2022-03-10': true, '2022-03-07': true}),
];

final DateTime nowMinusTwoDays = DateTime.now().subtract(Duration(days:2));

Widget buildBody(){
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
    if(habit.successAtDate[nowMinusTwoDays.add(Duration(days: i)).toIso8601String().substring(0,10)] == true){
      icons.add(Icon(Icons.check));
    } else {
      icons.add(Icon(Icons.clear));
    }
  }
  return icons;
}

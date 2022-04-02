import 'dart:convert';

import 'package:habit_changer/file-handling/HabitStorage.dart';
import 'package:habit_changer/file-handling/file_controller.dart';
import 'package:habit_changer/model/build/HabitBuild.dart';

class StoreHabit {

  static void saveHabitBuild(HabitBuild habitBuild){
    HabitStorage habitStorage = new HabitStorage(habitBuild.name);
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String json = encoder.convert(habitBuild.toJson());
    habitStorage.writeHabitJson(json);
  }
}
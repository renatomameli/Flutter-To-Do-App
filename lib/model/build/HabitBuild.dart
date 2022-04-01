import 'package:habit_changer/model/Habit.dart';
import 'package:habit_changer/model/build/HabitBuildAttractive.dart';
import 'package:habit_changer/model/build/HabitBuildEasy.dart';
import 'package:habit_changer/model/build/HabitBuildSatisfying.dart';
import 'HabitBuildObvious.dart';
import 'package:json_annotation/json_annotation.dart';
part 'HabitBuild.g.dart';


@JsonSerializable(explicitToJson: true)
class HabitBuild extends Habit {
  HabitBuild();

  late HabitBuildObvious habitBuildObvious;
  late HabitBuildAttractive habitBuildAttractive;
  late HabitBuildEasy habitBuildEasy;
  late HabitBuildSatisfying habitBuildSatisfying;


  factory HabitBuild.fromJson(Map<String, dynamic> json) => _$HabitBuildFromJson(json);
  Map<String, dynamic> toJson() => _$HabitBuildToJson(this);

  void setHabitBuildObvious(HabitBuildObvious habitBuildObvious){this.habitBuildObvious = habitBuildObvious;}
  void setHabitBuildAttractive(HabitBuildAttractive habitBuildAttractive){this.habitBuildAttractive = habitBuildAttractive;}
  void setHabitBuildEasy(HabitBuildEasy habitBuildEasy){this.habitBuildEasy = habitBuildEasy;}
  void setHabitBuildSatisfying(HabitBuildSatisfying habitBuildSatisfying){this.habitBuildSatisfying = habitBuildSatisfying;}
}

import 'package:json_annotation/json_annotation.dart';
part 'HabitBuildAttractive.g.dart';

@JsonSerializable()
class HabitBuildAttractive {
  late String advantages;
  late String environment;
  late String enjoyable;

  HabitBuildAttractive();

  factory HabitBuildAttractive.fromJson(Map<String, dynamic> json) => _$HabitBuildAttractiveFromJson(json);
  Map<String, dynamic> toJson() => _$HabitBuildAttractiveToJson(this);

  void setAdvantages(String advantages){this.advantages = advantages;}
  void setEnvironment(String environment){this.environment = environment;}
  void setEnjoyable(String enjoyable){this.enjoyable = enjoyable;}
}
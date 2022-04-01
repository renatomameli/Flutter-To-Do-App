import 'package:json_annotation/json_annotation.dart';
part 'HabitBuildEasy.g.dart';

@JsonSerializable()
class HabitBuildEasy {

  late String effort;
  late String technical;

  HabitBuildEasy();

  factory HabitBuildEasy.fromJson(Map<String, dynamic> json) => _$HabitBuildEasyFromJson(json);
  Map<String, dynamic> toJson() => _$HabitBuildEasyToJson(this);

  void setEffort(String effort){this.effort = effort;}
  void setTechnical(String technical){this.technical = technical;}
}
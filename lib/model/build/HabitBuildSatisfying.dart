import 'package:json_annotation/json_annotation.dart';
part 'HabitBuildSatisfying.g.dart';

@JsonSerializable()
class HabitBuildSatisfying {
  late String reward;

  HabitBuildSatisfying();

  factory HabitBuildSatisfying.fromJson(Map<String, dynamic> json) => _$HabitBuildSatisfyingFromJson(json);
  Map<String, dynamic> toJson() => _$HabitBuildSatisfyingToJson(this);

  void setReward(String reward){this.reward = reward;}
}
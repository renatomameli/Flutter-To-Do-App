import 'package:json_annotation/json_annotation.dart';
part 'HabitBuildObvious.g.dart';

@JsonSerializable()
class HabitBuildObvious {
  String? implementationIntentionAt;
  String? implementationIntentionIn;
  late List<String> triggers;
  String? habitCoupling;

  HabitBuildObvious();

  factory HabitBuildObvious.fromJson(Map<String, dynamic> json) => _$HabitBuildObviousFromJson(json);
  Map<String, dynamic> toJson() => _$HabitBuildObviousToJson(this);

  void setImplementationIntentionAt(String implementationIntentionAt){this.implementationIntentionAt=implementationIntentionAt;}
  void setImplementationIntentionIn(String implementationIntentionIt){this.implementationIntentionAt=implementationIntentionIt;}
  void setTriggers(List<String> triggers){this.triggers=triggers;}
  void setHabitCoupling(String habitCoupling){this.habitCoupling=habitCoupling;}
}
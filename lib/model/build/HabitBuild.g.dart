// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HabitBuild.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HabitBuild _$HabitBuildFromJson(Map<String, dynamic> json) {
  return HabitBuild()
    ..id = json['id'] as String?
    ..name = json['name'] as String
    ..question = json['question'] as String
    ..notes = json['notes'] as String?
    ..successAtDate = (json['successAtDate'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..habitBuildObvious = HabitBuildObvious.fromJson(
        json['habitBuildObvious'] as Map<String, dynamic>)
    ..habitBuildAttractive = HabitBuildAttractive.fromJson(
        json['habitBuildAttractive'] as Map<String, dynamic>)
    ..habitBuildEasy =
        HabitBuildEasy.fromJson(json['habitBuildEasy'] as Map<String, dynamic>)
    ..habitBuildSatisfying = HabitBuildSatisfying.fromJson(
        json['habitBuildSatisfying'] as Map<String, dynamic>);
}

Map<String, dynamic> _$HabitBuildToJson(HabitBuild instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'question': instance.question,
      'notes': instance.notes,
      'successAtDate': instance.successAtDate,
      'habitBuildObvious': instance.habitBuildObvious.toJson(),
      'habitBuildAttractive': instance.habitBuildAttractive.toJson(),
      'habitBuildEasy': instance.habitBuildEasy.toJson(),
      'habitBuildSatisfying': instance.habitBuildSatisfying.toJson(),
    };

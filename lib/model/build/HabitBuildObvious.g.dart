// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HabitBuildObvious.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HabitBuildObvious _$HabitBuildObviousFromJson(Map<String, dynamic> json) {
  return HabitBuildObvious()
    ..implementationIntentionAt = json['implementationIntentionAt'] as String?
    ..implementationIntentionIn = json['implementationIntentionIn'] as String?
    ..triggers =
        (json['triggers'] as List<dynamic>).map((e) => e as String).toList()
    ..habitCoupling = json['habitCoupling'] as String?;
}

Map<String, dynamic> _$HabitBuildObviousToJson(HabitBuildObvious instance) =>
    <String, dynamic>{
      'implementationIntentionAt': instance.implementationIntentionAt,
      'implementationIntentionIn': instance.implementationIntentionIn,
      'triggers': instance.triggers,
      'habitCoupling': instance.habitCoupling,
    };

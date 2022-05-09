// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      id: json['id'] as String,
      sleepHour: json['sleepHour'] as int,
      activeHour: json['activeHour'] as int,
      lastUpdate: json['lastUpdate'] as String,
      animalId: json['animalId'] as String?,
      animal: json['animal'] == null
          ? null
          : Animal.fromJson(json['animal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'id': instance.id,
      'sleepHour': instance.sleepHour,
      'activeHour': instance.activeHour,
      'lastUpdate': instance.lastUpdate,
      'animalId': instance.animalId,
      'animal': instance.animal,
    };

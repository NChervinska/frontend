// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityApiModel _$ActivityApiModelFromJson(Map<String, dynamic> json) =>
    ActivityApiModel(
      sleepHour: json['sleepHour'] as int,
      activeHour: json['activeHour'] as int,
      animalId: json['animalId'] as String,
    );

Map<String, dynamic> _$ActivityApiModelToJson(ActivityApiModel instance) =>
    <String, dynamic>{
      'sleepHour': instance.sleepHour,
      'activeHour': instance.activeHour,
      'animalId': instance.animalId,
    };

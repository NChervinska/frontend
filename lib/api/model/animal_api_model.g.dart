// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalApiModel _$AnimalApiModelFromJson(Map<String, dynamic> json) =>
    AnimalApiModel(
      name: json['name'] as String,
      type: json['type'] as String,
      weight: json['weight'] as int,
      age: json['age'] as int,
      clientId: json['clientId'] as String,
      employeeId: json['employeeId'] as String,
    );

Map<String, dynamic> _$AnimalApiModelToJson(AnimalApiModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'weight': instance.weight,
      'age': instance.age,
      'clientId': instance.clientId,
      'employeeId': instance.employeeId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animal _$AnimalFromJson(Map<String, dynamic> json) => Animal(
      id: json['id'] as String,
      name: json['name'] as String,
      type: TypeExt.fromJson(json['type'] as String),
      weight: json['weight'] as int,
      age: json['age'] as int,
      clientId: json['clientId'] as String?,
      employeeId: json['employeeId'] as String?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      employee: json['employee'] == null
          ? null
          : Employee.fromJson(json['employee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimalToJson(Animal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': TypeExt.toJson(instance.type),
      'weight': instance.weight,
      'age': instance.age,
      'clientId': instance.clientId,
      'employeeId': instance.employeeId,
      'client': instance.client,
      'employee': instance.employee,
    };

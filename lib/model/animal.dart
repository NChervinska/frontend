import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'client.dart';
import 'employee.dart';
import 'package:json_annotation/json_annotation.dart';

import 'type.dart';

part 'animal.g.dart';

@immutable
@JsonSerializable()
class Animal extends Equatable {
  final String id;
  final String name;
  @JsonKey(fromJson: TypeExt.fromJson, toJson: TypeExt.toJson)
  final TypeEnum type;
  final int weight;
  final int age;
  final String? clientId;
  final String? employeeId;
  final Client? client;
  final Employee? employee;

  const Animal({
    required this.id,
    required this.name,
    required this.type,
    required this.weight,
    required this.age,
    this.clientId,
    this.employeeId,
    this.client,
    this.employee,
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return _$AnimalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnimalToJson(this);

  @override
  List<Object?> get props {
    return [id, name, type, weight, age, clientId, employeeId];
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'animal_api_model.g.dart';

@immutable
@JsonSerializable()
class AnimalApiModel extends Equatable {
  final String name;
  final String type;
  final int weight;
  final int age;
  final String clientId;
  final String employeeId;

  const AnimalApiModel({
    required this.name,
    required this.type,
    required this.weight,
    required this.age,
    required this.clientId,
    required this.employeeId,
  });

  factory AnimalApiModel.fromJson(Map<String, dynamic> json) {
    return _$AnimalApiModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnimalApiModelToJson(this);

  @override
  List<Object?> get props {
    return [name, type, weight, age, clientId, employeeId];
  }
}

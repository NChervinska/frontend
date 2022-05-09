import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@immutable
@JsonSerializable()
class Employee extends Equatable {
  final String id;
  final String name;
  final String surname;
  final String phone;
  final String userId;

  const Employee({
    required this.id,
    required this.name,
    required this.surname,
    required this.phone,
    required this.userId,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return _$EmployeeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  @override
  List<Object?> get props {
    return [id, name, surname, phone, userId];
  }
}

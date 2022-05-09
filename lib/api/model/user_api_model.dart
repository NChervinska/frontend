import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_api_model.g.dart';

@immutable
@JsonSerializable()
class UserApiModel extends Equatable {
  final String email;
  final String password;
  final String role;
  final String name;
  final String surname;
  final String phone;

  const UserApiModel({
    required this.email,
    required this.password,
    required this.role,
    required this.name,
    required this.phone,
    required this.surname,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    return _$UserApiModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);

  @override
  List<Object?> get props {
    return [email, password, role, name, surname, phone];
  }
}

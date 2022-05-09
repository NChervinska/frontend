import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@immutable
@JsonSerializable()
class UserResponseModel extends Equatable {
  final String id;
  final String email;
  final String role;

  const UserResponseModel({
    required this.id,
    required this.email,
    required this.role,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);

  @override
  List<Object?> get props {
    return [email, id, role];
  }
}

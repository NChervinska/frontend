import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_model.g.dart';

@immutable
@JsonSerializable()
class ChangePasswordModel extends Equatable {
  final String oldPassword;
  final String newPassword;

  const ChangePasswordModel({
    required this.oldPassword,
    required this.newPassword,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);

  @override
  List<Object?> get props {
    return [oldPassword, newPassword];
  }
}

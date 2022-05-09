import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jwt_response_model.g.dart';

@immutable
@JsonSerializable()
class JwtResponseModel extends Equatable {
  final String jwt;

  const JwtResponseModel({
    required this.jwt,
  });

  factory JwtResponseModel.fromJson(Map<String, dynamic> json) {
    return _$JwtResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JwtResponseModelToJson(this);

  @override
  List<Object?> get props {
    return [jwt];
  }
}

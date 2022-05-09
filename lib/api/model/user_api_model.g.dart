// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApiModel _$UserApiModelFromJson(Map<String, dynamic> json) => UserApiModel(
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      surname: json['surname'] as String,
    );

Map<String, dynamic> _$UserApiModelToJson(UserApiModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'name': instance.name,
      'surname': instance.surname,
      'phone': instance.phone,
    };

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

@immutable
@JsonSerializable()
class Client extends Equatable {
  final String id;
  final String name;
  final String surname;
  final String phone;
  final int bonus;
  final String userId;

  const Client({
    required this.id,
    required this.name,
    required this.surname,
    required this.phone,
    required this.bonus,
    required this.userId,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return _$ClientFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClientToJson(this);

  @override
  List<Object?> get props {
    return [id, name, surname, phone, bonus, userId];
  }
}

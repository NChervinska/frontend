import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity_api_model.g.dart';

@immutable
@JsonSerializable()
class ActivityApiModel extends Equatable {
  final int sleepHour;
  final int activeHour;
  final String animalId;

  const ActivityApiModel({
    required this.sleepHour,
    required this.activeHour,
    required this.animalId,
  });

  factory ActivityApiModel.fromJson(Map<String, dynamic> json) {
    return _$ActivityApiModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ActivityApiModelToJson(this);

  @override
  List<Object?> get props {
    return [sleepHour, activeHour, animalId];
  }
}

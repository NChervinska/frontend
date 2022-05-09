import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/model/animal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

@immutable
@JsonSerializable()
class Activity extends Equatable {
  final String id;
  final int sleepHour;
  final int activeHour;
  final String lastUpdate;
  final String? animalId;
  final Animal? animal;

  const Activity({
    required this.id,
    required this.sleepHour,
    required this.activeHour,
    required this.lastUpdate,
    this.animalId,
    this.animal,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return _$ActivityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ActivityToJson(this);

  @override
  List<Object?> get props {
    return [id, sleepHour, activeHour, animalId];
  }
}

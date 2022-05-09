import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:frontend/model/activity.dart';

enum ActivityStatus {
  success,
  error,
}

@immutable
class ActivityState extends Equatable {
  final ActivityStatus status;
  final String errorMessage;
  final List<Activity> activities;
  final String animalId;

  const ActivityState({
    required this.animalId,
    this.status = ActivityStatus.success,
    this.errorMessage = '',
    this.activities = const [],
  });

  ActivityState copyWith({
    ActivityStatus? status,
    String? errorMessage,
    List<Activity>? activities,
    String? animalId,
  }) {
    return ActivityState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      activities: activities ?? this.activities,
      animalId: animalId ?? this.animalId,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, activities, animalId];
}

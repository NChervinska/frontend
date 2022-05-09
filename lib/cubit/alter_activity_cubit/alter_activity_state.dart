import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../model/activity.dart';

enum AlterActivityStatus {
  initial,
  success,
  error,
}

@immutable
class AlterActivityState extends Equatable {
  final AlterActivityStatus status;
  final String errorMessage;
  final Activity? activity;
  final String animal;

  const AlterActivityState({
    this.status = AlterActivityStatus.success,
    this.errorMessage = '',
    required this.animal,
    this.activity,
  });

  @override
  List<Object?> get props => [status, errorMessage, animal, activity];

  AlterActivityState copyWith({
    AlterActivityStatus? status,
    String? errorMessage,
    Activity? activity,
    String? animal,
  }) {
    return AlterActivityState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      activity: activity ?? this.activity,
      animal: animal ?? this.animal,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../model/chart_data.dart';

enum ActivityStatisticStatus {
  success,
  error,
  init,
}

@immutable
class ActivityStatisticState extends Equatable {
  final ActivityStatisticStatus status;
  final String errorMessage;
  final List<ChartData> sleepData;
  final List<ChartData> activeData;

  const ActivityStatisticState({
    this.status = ActivityStatisticStatus.success,
    this.errorMessage = '',
    this.sleepData = const [],
    this.activeData = const [],
  });

  ActivityStatisticState copyWith({
    ActivityStatisticStatus? status,
    String? errorMessage,
    List<ChartData>? sleepData,
    List<ChartData>? activeData,
  }) {
    return ActivityStatisticState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      sleepData: sleepData ?? this.sleepData,
      activeData: activeData ?? this.activeData,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, activeData, sleepData];
}

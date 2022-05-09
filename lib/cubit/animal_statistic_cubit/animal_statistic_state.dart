import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/model/chart_data.dart';

enum AnimalStatisticStatus {
  success,
  error,
  loading,
}

@immutable
class AnimalStatisticState extends Equatable {
  final AnimalStatisticStatus status;
  final String errorMessage;
  final List<ChartData> breedData;
  final List<ChartData> userStatistic;

  const AnimalStatisticState({
    this.status = AnimalStatisticStatus.success,
    this.errorMessage = '',
    this.breedData = const [],
    this.userStatistic = const [],
  });

  @override
  List<Object?> get props {
    return [
      status,
      errorMessage,
      breedData,
      userStatistic,
    ];
  }

  AnimalStatisticState copyWith({
    AnimalStatisticStatus? status,
    String? errorMessage,
    List<ChartData>? breedData,
    List<ChartData>? userStatistic,
  }) {
    return AnimalStatisticState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      breedData: breedData ?? this.breedData,
      userStatistic: userStatistic ?? this.userStatistic,
    );
  }
}

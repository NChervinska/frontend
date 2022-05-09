import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../model/animal.dart';

enum AnimalPageStatus {
  success,
  error,
  loading,
}

@immutable
class AnimalPageState extends Equatable {
  final AnimalPageStatus status;
  final String errorMessage;
  final Animal? animal;
  final String recommendation;
  final String feed;

  const AnimalPageState({
    this.status = AnimalPageStatus.loading,
    this.errorMessage = '',
    this.recommendation = '',
    this.feed = '',
    this.animal,
  });

  @override
  List<Object?> get props {
    return [
      status,
      errorMessage,
      animal,
      recommendation,
      feed,
    ];
  }

  AnimalPageState copyWith({
    AnimalPageStatus? status,
    String? errorMessage,
    Animal? animal,
    String? recommendation,
    String? feed,
  }) {
    return AnimalPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      animal: animal ?? this.animal,
      recommendation: recommendation ?? this.recommendation,
      feed: feed ?? this.feed,
    );
  }
}

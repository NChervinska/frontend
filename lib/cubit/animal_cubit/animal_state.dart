import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:frontend/model/animal.dart';

enum AnimalStatus {
  success,
  error,
}

@immutable
class AnimalState extends Equatable {
  final AnimalStatus status;
  final String errorMessage;
  final List<Animal> animals;

  const AnimalState({
    this.status = AnimalStatus.success,
    this.errorMessage = '',
    this.animals = const [],
  });

  @override
  List<Object?> get props => [status, errorMessage, animals];

  AnimalState copyWith({
    AnimalStatus? status,
    String? errorMessage,
    List<Animal>? animals,
  }) {
    return AnimalState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      animals: animals ?? this.animals,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ChangePasswordStatus {
  success,
  error,
  init,
}

@immutable
class ChangePasswordState extends Equatable {
  final ChangePasswordStatus status;
  final String errorMessage;

  const ChangePasswordState({
    this.status = ChangePasswordStatus.init,
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [status, errorMessage];

  ChangePasswordState copyWith({
    ChangePasswordStatus? status,
    String? errorMessage,
  }) {
    return ChangePasswordState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

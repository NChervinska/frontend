import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum RegisterStatus {
  success,
  error,
  init,
}

@immutable
class RegisterState extends Equatable {
  final RegisterStatus status;
  final String errorMessage;

  const RegisterState({
    this.status = RegisterStatus.init,
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [status, errorMessage];

  RegisterState copyWith({
    RegisterStatus? status,
    String? errorMessage,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum LoginStatus {
  success,
  init,
  error,
}

@immutable
class LoginState extends Equatable {
  final LoginStatus status;
  final String errorMessage;

  const LoginState({
    this.status = LoginStatus.init,
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [status, errorMessage];

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/api/model/user_response_model.dart';

enum UserStatus {
  success,
  error,
}

@immutable
class UserState extends Equatable {
  final UserStatus status;
  final String errorMessage;
  final List<UserResponseModel> users;

  const UserState({
    this.status = UserStatus.success,
    this.errorMessage = '',
    this.users = const [],
  });

  @override
  List<Object?> get props => [status, errorMessage, users];

  UserState copyWith({
    UserStatus? status,
    String? errorMessage,
    List<UserResponseModel>? users,
  }) {
    return UserState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      users: users ?? this.users,
    );
  }
}

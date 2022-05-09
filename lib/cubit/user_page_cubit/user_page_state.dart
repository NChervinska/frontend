import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../model/client.dart';
import '../../model/employee.dart';

enum UserPageStatus {
  success,
  error,
  loading,
}

@immutable
class UserPageState extends Equatable {
  final UserPageStatus status;
  final String role;
  final String errorMessage;
  final Client? client;
  final Employee? employee;

  const UserPageState({
    this.status = UserPageStatus.loading,
    this.errorMessage = '',
    this.client,
    this.employee,
    this.role = 'employee',
  });

  @override
  List<Object?> get props {
    return [
      status,
      errorMessage,
      role,
      employee,
      client,
    ];
  }

  UserPageState copyWith({
    UserPageStatus? status,
    String? errorMessage,
    String? role,
    Client? client,
    Employee? employee,
  }) {
    return UserPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      role: role ?? this.role,
      client: client ?? this.client,
      employee: employee ?? this.employee,
    );
  }
}

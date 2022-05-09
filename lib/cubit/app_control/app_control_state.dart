import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/model/employee.dart';
import 'package:intl/intl.dart';

enum AppControlStatus {
  success,
  error,
}

@immutable
class AppControlState extends Equatable {
  final AppControlStatus status;
  final String errorMessage;
  final Locale? locale;
  final Employee? employee;

  final bool isAdmin;

  const AppControlState({
    this.status = AppControlStatus.success,
    this.errorMessage = '',
    this.locale,
    this.isAdmin = false,
    this.employee,
  });

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        locale,
        isAdmin,
        employee,
      ];

  AppControlState copyWith({
    AppControlStatus? status,
    String? errorMessage,
    Locale? locale,
    DateFormat? format,
    bool? isAdmin,
    Employee? employee,
  }) {
    return AppControlState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      locale: locale ?? this.locale,
      isAdmin: isAdmin ?? this.isAdmin,
      employee: employee ?? this.employee,
    );
  }
}

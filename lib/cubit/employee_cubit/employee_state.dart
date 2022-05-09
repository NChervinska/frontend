import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:frontend/model/employee.dart';

enum EmployeeStatus {
  success,
  error,
}

@immutable
class EmployeeState extends Equatable {
  final EmployeeStatus status;
  final String errorMessage;
  final List<Employee> employees;

  const EmployeeState({
    this.status = EmployeeStatus.success,
    this.errorMessage = '',
    this.employees = const [],
  });

  @override
  List<Object?> get props => [status, errorMessage, employees];

  EmployeeState copyWith({
    EmployeeStatus? status,
    String? errorMessage,
    List<Employee>? employees,
  }) {
    return EmployeeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      employees: employees ?? this.employees,
    );
  }
}

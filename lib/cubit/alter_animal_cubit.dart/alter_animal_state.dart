import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:frontend/model/animal.dart';
import 'package:frontend/model/client.dart';
import 'package:frontend/model/employee.dart';

enum AlterAnimalStatus {
  initial,
  success,
  error,
}

@immutable
class AlterAnimalState extends Equatable {
  final AlterAnimalStatus status;
  final String errorMessage;
  final Animal? animal;
  final List<Client> clients;
  final List<Employee> employees;

  const AlterAnimalState({
    this.status = AlterAnimalStatus.success,
    this.errorMessage = '',
    this.animal,
    this.clients = const [],
    this.employees = const [],
  });

  AlterAnimalState copyWith({
    AlterAnimalStatus? status,
    String? errorMessage,
    Animal? animal,
    List<Client>? clients,
    List<Employee>? employees,
  }) {
    return AlterAnimalState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      animal: animal ?? this.animal,
      clients: clients ?? this.clients,
      employees: employees ?? this.employees,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, animal];
}

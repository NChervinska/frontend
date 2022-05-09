import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:frontend/model/client.dart';

enum ClientStatus {
  success,
  error,
}

@immutable
class ClientState extends Equatable {
  final ClientStatus status;
  final String errorMessage;
  final List<Client> clients;

  const ClientState({
    this.status = ClientStatus.success,
    this.errorMessage = '',
    this.clients = const [],
  });

  @override
  List<Object?> get props => [status, errorMessage, clients];

  ClientState copyWith({
    ClientStatus? status,
    String? errorMessage,
    List<Client>? clients,
  }) {
    return ClientState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      clients: clients ?? this.clients,
    );
  }
}

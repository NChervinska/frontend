import 'package:frontend/cubit/client_cubit/client_state.dart';
import 'package:frontend/cubit/core/base_cubit.dart';
import 'package:frontend/service/api_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClientCubit extends BaseCubit<ClientState> {
  ClientCubit(this.apiService) : super(const ClientState());
  final ApiService apiService;

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: ClientStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init() async {
    await performSafeAction(() async {
      emit(state.copyWith(
        status: ClientStatus.success,
        clients: await apiService.getAllClient(),
      ));
    });
  }
}

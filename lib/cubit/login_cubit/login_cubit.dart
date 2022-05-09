import 'package:frontend/api/model/login_api_model.dart';
import 'package:frontend/cubit/core/base_cubit.dart';
import 'package:frontend/cubit/login_cubit/login_state.dart';
import 'package:frontend/service/api_service.dart';
import 'package:frontend/service/preferences_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends BaseCubit<LoginState> {
  final ApiService apiService;
  final PreferencesService preferencesService;

  LoginCubit(this.apiService, this.preferencesService)
      : super(const LoginState());
  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: LoginStatus.error,
      errorMessage: errorMessage,
    ));
    emit(state.copyWith(status: LoginStatus.init));
  }

  Future<void> init() async {
    emit(state.copyWith(status: LoginStatus.init));
    if (preferencesService.getAccessToken() != null) {
      emit(state.copyWith(status: LoginStatus.success));
    }
  }

  Future<void> login(LoginApiModel loginApiModel) async {
    emit(state.copyWith(status: LoginStatus.init));
    await performSafeAction(() async {
      final res = await apiService.login(loginApiModel);
      await preferencesService.setAccessToken(res.jwt);
      emit(state.copyWith(status: LoginStatus.success));
    });
  }
}

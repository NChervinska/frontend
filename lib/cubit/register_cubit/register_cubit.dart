import '../../api/model/user_api_model.dart';
import '../../constants/constant_string.dart';
import '../core/base_cubit.dart';
import '../../service/api_service.dart';
import 'package:injectable/injectable.dart';

import 'register_state.dart';

@injectable
class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit(this.apiService) : super(const RegisterState());
  final ApiService apiService;

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: RegisterStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> register({
    required String email,
    required String name,
    required String phone,
    required String surname,
  }) async {
    await performSafeAction(() async {
      await apiService.register(UserApiModel(
        email: email,
        password: '1111',
        role: ConstantString.employee,
        name: name,
        phone: phone,
        surname: surname,
      ));
      emit(state.copyWith(status: RegisterStatus.success));
    });
  }

  Future<void> editEmployee({
    required String email,
    required String name,
    required String phone,
    required String surname,
  }) async {
    await performSafeAction(() async {
      await apiService.editEmployee(UserApiModel(
        email: email,
        password: '1111',
        role: ConstantString.employee,
        name: name,
        phone: phone,
        surname: surname,
      ));
      emit(state.copyWith(status: RegisterStatus.success));
    });
  }
}

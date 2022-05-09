import '../../api/model/change_password_model.dart';
import '../core/base_cubit.dart';
import '../../service/api_service.dart';
import 'package:injectable/injectable.dart';

import 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends BaseCubit<ChangePasswordState> {
  ChangePasswordCubit(this.apiService) : super(const ChangePasswordState());
  final ApiService apiService;

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: ChangePasswordStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> changePassword({
    required String newPassword,
    required String oldPassword,
  }) async {
    await performSafeAction(() async {
      await apiService.changePassword(ChangePasswordModel(
        oldPassword: oldPassword,
        newPassword: newPassword,
      ));
      emit(state.copyWith(status: ChangePasswordStatus.success));
    });
  }
}

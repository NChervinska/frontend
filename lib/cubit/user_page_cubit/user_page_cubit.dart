import 'package:frontend/constants/constant_string.dart';

import '../core/base_cubit.dart';
import '../../service/api_service.dart';
import 'user_page_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserPageCubit extends BaseCubit<UserPageState> {
  UserPageCubit(this.apiService) : super(const UserPageState());
  final ApiService apiService;

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: UserPageStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init(String id, String role) async {
    await performSafeAction(() async {
      if (role == ConstantString.employee) {
        emit(state.copyWith(
          employee: await apiService.getEmployeeByUserId(id),
          status: UserPageStatus.success,
          role: role,
        ));
        return;
      }
      emit(state.copyWith(
        client: await apiService.getClientByUserId(id),
        status: UserPageStatus.success,
        role: role,
      ));
    });
  }
}

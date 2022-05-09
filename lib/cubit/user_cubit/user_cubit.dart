import '../core/base_cubit.dart';
import '../../service/api_service.dart';
import 'user_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserCubit extends BaseCubit<UserState> {
  UserCubit(this.apiService) : super(const UserState());
  final ApiService apiService;

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: UserStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init() async {
    await performSafeAction(() async {
      emit(state.copyWith(
        status: UserStatus.success,
        users: await apiService.getAllUser(),
      ));
    });
  }
}

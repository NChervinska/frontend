import 'package:frontend/cubit/core/base_cubit.dart';
import 'package:frontend/cubit/employee_cubit/employee_state.dart';
import 'package:frontend/service/api_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class EmployeeCubit extends BaseCubit<EmployeeState> {
  EmployeeCubit(this.apiService) : super(const EmployeeState());
  final ApiService apiService;

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: EmployeeStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init() async {
    await performSafeAction(() async {
      emit(state.copyWith(
        status: EmployeeStatus.success,
        employees: await apiService.getAllEmployee(),
      ));
    });
  }

  Future<void> delete(String employeeID) async {
    await performSafeAction(() async {
      await apiService.deleteEmployee(employeeID);
      await init();
    });
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/constants/constant_string.dart';
import 'package:frontend/cubit/app_control/app_control_state.dart';
import 'package:frontend/cubit/core/base_cubit.dart';
import 'package:frontend/service/api_service.dart';
import 'package:frontend/service/preferences_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppControlCubit extends BaseCubit<AppControlState> {
  final ApiService apiService;
  final PreferencesService preferencesService;

  AppControlCubit(this.apiService, this.preferencesService)
      : super(const AppControlState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: AppControlStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> getAdmin(String email) async {
    await performSafeAction(() async {
      if (email.contains(ConstantString.admin)) {
        emit(state.copyWith(isAdmin: true));
      } else {
        emit(state.copyWith(
          isAdmin: false,
          employee: await apiService.getEmployeeByToken(),
        ));
      }
    });
  }

  Future<void> updateLocale(Locale locale) async {
    await performSafeAction(() async {
      emit(state.copyWith(locale: locale));
    });
  }

  Future<void> backup() async {
    await performSafeAction(() async {
      await apiService.backup();
    });
  }

  Future<void> restore() async {
    await performSafeAction(() async {
      await apiService.restore();
    });
  }
}

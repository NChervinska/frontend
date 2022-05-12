import 'package:frontend/api/model/activity_api_model.dart';
import 'package:frontend/cubit/alter_activity_cubit/alter_activity_state.dart';
import 'package:frontend/cubit/core/base_cubit.dart';
import 'package:frontend/service/api_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class AlterActivityCubit extends BaseCubit<AlterActivityState> {
  final ApiService apiService;
  AlterActivityCubit(this.apiService, @factoryParam String? animal)
      : super(AlterActivityState(animal: animal!));

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: AlterActivityStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init(String? activityId) async {
    await performSafeAction(() async {
      if (activityId != null) {
        emit(state.copyWith(
          activity: await apiService.getActivity(activityId),
        ));
      }
      emit(state.copyWith(status: AlterActivityStatus.initial));
    });
  }

  Future<void> update({
    required String id,
    required int sleepHour,
    required int activeHour,
  }) async {
    await performSafeAction(() async {
      await apiService.editActivity(
        id,
        ActivityApiModel(
          sleepHour: sleepHour,
          activeHour: activeHour,
          animalId: state.animal,
        ),
      );
      emit(state.copyWith(status: AlterActivityStatus.success));
    });
  }

  Future<void> crete({
    required int sleepHour,
    required int activeHour,
  }) async {
    await performSafeAction(() async {
      await apiService.addActivity(
        ActivityApiModel(
          sleepHour: sleepHour,
          activeHour: activeHour,
          animalId: state.animal,
        ),
      );
      emit(state.copyWith(status: AlterActivityStatus.success));
    });
  }
}

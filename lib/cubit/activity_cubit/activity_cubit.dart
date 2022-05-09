import 'package:frontend/cubit/activity_cubit/activity_state.dart';
import 'package:frontend/cubit/core/base_cubit.dart';
import 'package:frontend/service/api_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class ActivityCubit extends BaseCubit<ActivityState> {
  final ApiService apiService;
  ActivityCubit(
    this.apiService,
    @factoryParam String? animalId,
  ) : super(ActivityState(animalId: animalId ?? ''));

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: ActivityStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init() async {
    await performSafeAction(() async {
      final activities = await apiService.getActivityByAnimalId(
        state.animalId,
      );

      emit(state.copyWith(
        status: ActivityStatus.success,
        activities: activities,
      ));
    });
  }

  Future<void> delete(String id) async {
    await performSafeAction(() async {
      await apiService.deleteActivity(id);
      await init();
    });
  }
}

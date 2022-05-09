import 'package:frontend/cubit/core/base_cubit.dart';
import 'package:frontend/model/chart_data.dart';
import 'package:frontend/service/api_service.dart';
import 'package:injectable/injectable.dart';

import 'activity_statistic_state.dart';

@injectable
class ActivityStatisticCubit extends BaseCubit<ActivityStatisticState> {
  final ApiService apiService;
  ActivityStatisticCubit(this.apiService)
      : super(const ActivityStatisticState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: ActivityStatisticStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init(String animalId) async {
    await performSafeAction(() async {
      final activities = await apiService.getActivityByAnimalId(animalId);
      final sleepData = activities.map((activity) {
        return ChartData(
          activity.lastUpdate,
          activity.sleepHour.toDouble(),
        );
      }).toList();
      final activeData = activities.map((activity) {
        return ChartData(
          activity.lastUpdate,
          activity.activeHour.toDouble(),
        );
      }).toList();
      emit(state.copyWith(
        status: ActivityStatisticStatus.success,
        sleepData: sleepData,
        activeData: activeData,
      ));
    });
  }
}

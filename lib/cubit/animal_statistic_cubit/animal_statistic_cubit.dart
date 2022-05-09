import 'package:frontend/model/chart_data.dart';

import '../../model/animal.dart';
import '../../model/type.dart';
import '../core/base_cubit.dart';
import '../../service/api_service.dart';
import 'package:injectable/injectable.dart';

import 'animal_statistic_state.dart';

@injectable
class AnimalStatisticCubit extends BaseCubit<AnimalStatisticState> {
  final ApiService apiService;
  AnimalStatisticCubit(this.apiService) : super(const AnimalStatisticState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: AnimalStatisticStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init(bool admin) async {
    late final List<Animal> animals;
    if (admin) {
      animals = await apiService.getAllAnimal();
    } else {
      animals = await apiService.getAnimalByEmployeeId();
    }
    await getBreedStatistic(animals);
    await getUserStatistic(animals);
    emit(state.copyWith(status: AnimalStatisticStatus.success));
  }

  Future<void> getBreedStatistic(List<Animal> animals) async {
    await performSafeAction(() async {
      final length = 100 / animals.length;
      final data = TypeEnum.values.map((type) {
        return ChartData(
          type.name,
          animals.where((element) => element.type == type).length * length,
        );
      }).toList();

      emit(state.copyWith(breedData: data));
    });
  }

  Future<void> getUserStatistic(List<Animal> animals) async {
    await performSafeAction(() async {
      final users = await apiService.getAllEmployee();
      final data = users.map((user) {
        return ChartData(
          '${user.surname} ${user.name}',
          animals
              .where((element) => element.employeeId == user.id)
              .length
              .toDouble(),
        );
      }).toList();
      emit(state.copyWith(userStatistic: data));
    });
  }
}

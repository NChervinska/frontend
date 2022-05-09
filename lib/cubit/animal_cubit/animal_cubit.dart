import 'package:frontend/cubit/animal_cubit/animal_state.dart';
import 'package:frontend/cubit/core/base_cubit.dart';
import 'package:frontend/service/api_service.dart';
import 'package:injectable/injectable.dart';

import '../../model/animal.dart';

@injectable
class AnimalCubit extends BaseCubit<AnimalState> {
  final ApiService apiService;
  AnimalCubit(this.apiService) : super(const AnimalState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: AnimalStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init(bool admin) async {
    await performSafeAction(() async {
      late final List<Animal> animals;
      if (admin) {
        animals = await apiService.getAllAnimal();
      } else {
        animals = await apiService.getAnimalByEmployeeId();
      }
      emit(state.copyWith(
        status: AnimalStatus.success,
        animals: animals,
      ));
    });
  }
}

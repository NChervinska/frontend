import 'package:frontend/api/model/animal_api_model.dart';
import 'package:frontend/cubit/alter_animal_cubit.dart/alter_animal_state.dart';
import 'package:frontend/cubit/core/base_cubit.dart';
import 'package:frontend/service/api_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class AlterAnimalCubit extends BaseCubit<AlterAnimalState> {
  final ApiService apiService;
  AlterAnimalCubit(this.apiService) : super(const AlterAnimalState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: AlterAnimalStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init(String? animalId) async {
    await performSafeAction(() async {
      if (animalId != null) {
        emit(state.copyWith(
          animal: await apiService.getAnimal(animalId),
          clients: await apiService.getAllClient(),
          employees: await apiService.getAllEmployee(),
        ));
      }
      emit(state.copyWith(status: AlterAnimalStatus.initial));
    });
  }

  Future<void> update(String id, AnimalApiModel animalApi) async {
    await performSafeAction(() async {
      await apiService.editAnimal(id, animalApi);
    });
  }

  Future<void> crete(AnimalApiModel animalApiModel) async {
    await performSafeAction(() async {
      await apiService.addAnimal(animalApiModel);
    });
  }
}

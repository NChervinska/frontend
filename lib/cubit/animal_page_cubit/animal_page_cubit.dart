import '../core/base_cubit.dart';
import '../../service/api_service.dart';
import 'animal_page_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AnimalPageCubit extends BaseCubit<AnimalPageState> {
  AnimalPageCubit(this.apiService) : super(const AnimalPageState());
  final ApiService apiService;

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: AnimalPageStatus.error,
      errorMessage: errorMessage,
    ));
  }

  Future<void> init(String id) async {
    await performSafeAction(() async {
      emit(state.copyWith(
        animal: await apiService.getAnimal(id),
        status: AnimalPageStatus.success,
        recommendation: await apiService.careRecomendation(id),
        feed: await apiService.feedRecomendation(id),
      ));
    });
  }
}

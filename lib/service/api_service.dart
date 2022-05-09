import 'package:injectable/injectable.dart';
import '../api/model/activity_api_model.dart';
import '../api/model/animal_api_model.dart';
import '../api/model/change_password_model.dart';
import '../api/model/jwt_response_model.dart';
import '../api/model/login_api_model.dart';
import '../api/model/user_api_model.dart';
import '../api/model/user_response_model.dart';
import '../model/employee.dart';
import '../api/animal_hostel_api_client.dart';
import '../model/activity.dart';
import '../model/animal.dart';
import '../model/client.dart';
import 'base_service.dart';

@injectable
class ApiService extends BaseService {
  final AnimalHostelApiClient _apiClient;

  ApiService(this._apiClient);

  Future<Activity> addActivity(ActivityApiModel activityApiModel) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.addActivity(activityApiModel);
    });
  }

  Future<Activity> getActivity(String activityId) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getActivity(activityId);
    });
  }

  Future<Animal> addAnimal(AnimalApiModel animalApiModel) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.addAnimal(animalApiModel);
    });
  }

  Future<String> backup() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.backup();
    });
  }

  Future<String> careRecomendation(String id) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.careRecomendation(id);
    });
  }

  Future<String> changeEmail(String email) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.changeEmail(email);
    });
  }

  Future<String> changePassword(
    ChangePasswordModel changePasswordModel,
  ) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.changePassword(changePasswordModel);
    });
  }

  Future<String> deleteActivity(String id) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.deleteActivity(id);
    });
  }

  Future<String> deleteEmployee(String id) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.deleteEmployee(id);
    });
  }

  Future<ActivityApiModel> editActivity(
    String id,
    ActivityApiModel activityApiModel,
  ) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.editActivity(id, activityApiModel);
    });
  }

  Future<Animal> editAnimal(
    String id,
    AnimalApiModel animalApiModel,
  ) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.editAnimal(id, animalApiModel);
    });
  }

  Future<UserApiModel> editEmployee(UserApiModel userApiModel) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.editEmployee(userApiModel);
    });
  }

  Future<String> feedRecomendation(String id) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.feedRecomendation(id);
    });
  }

  Future<List<Activity>> getActivityByAnimalId(String animalId) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getActivityByAnimalId(animalId);
    });
  }

  Future<List<Activity>> getActivityStatistic(String animalId) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getActivityStatistic(animalId);
    });
  }

  Future<List<Animal>> getAllAnimal() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getAllAnimal();
    });
  }

  Future<List<Client>> getAllClient() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getAllClient();
    });
  }

  Future<List<Employee>> getAllEmployee() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getAllEmployee();
    });
  }

  Future<List<UserResponseModel>> getAllUser() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getAllUser();
    });
  }

  Future<Animal> getAnimal(String id) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getAnimal(id);
    });
  }

  Future<List<Animal>> getAnimalByEmployeeId() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getAnimalByEmployeeId();
    });
  }

  Future<Client> getClient(String id) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getClient(id);
    });
  }

  Future<Client> getClientByUserId(String id) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getClientByUserId(id);
    });
  }

  Future<Employee> getEmployee(String id) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getEmployee(id);
    });
  }

  Future<Employee> getEmployeeByToken() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getEmployeeByToken();
    });
  }

  Future<Employee> getEmployeeByUserId(String id) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getEmployeeByUserId(id);
    });
  }

  Future<UserResponseModel> getUser(String id) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getUser(id);
    });
  }

  Future<JwtResponseModel> login(LoginApiModel loginApiModel) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.login(loginApiModel);
    });
  }

  Future<UserResponseModel> register(UserApiModel userApiModel) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.register(userApiModel);
    });
  }

  Future<String> restore() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.restore();
    });
  }
}

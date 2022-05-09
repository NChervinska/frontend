import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/activity.dart';
import '../model/animal.dart';
import '../model/client.dart';
import '../model/employee.dart';
import 'api_constants.dart';
import 'model/activity_api_model.dart';
import 'model/animal_api_model.dart';
import 'model/change_password_model.dart';
import 'model/jwt_response_model.dart';
import 'model/login_api_model.dart';
import 'model/user_api_model.dart';
import 'model/user_response_model.dart';

part 'animal_hostel_api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AnimalHostelApiClient {
  factory AnimalHostelApiClient(
    Dio dio, {
    String baseUrl,
  }) = _AnimalHostelApiClient;

  ///
  /// USER
  ///

  @GET("/api/user/restore")
  Future<String> restore();

  @GET("/api/user/backup")
  Future<String> backup();

  @POST("/api/user/changePassword")
  Future<String> changePassword(
    @Body() ChangePasswordModel changePasswordModel,
  );

  @POST("/api/user/changeEmail")
  Future<String> changeEmail(@Body() String email);

  @POST("/api/user/login")
  Future<JwtResponseModel> login(@Body() LoginApiModel loginApiModel);

  @POST("/api/user/register")
  Future<UserResponseModel> register(@Body() UserApiModel userApiModel);

  @POST("/api/user/{id}")
  Future<UserResponseModel> getUser(@Path('id') String id);

  @GET("/api/user/getAll")
  Future<List<UserResponseModel>> getAllUser();

  ///
  /// EMPLOYEE
  ///

  @GET("/api/employee/{id}")
  Future<Employee> getEmployee(@Path('id') String id);

  @GET("/api/employee")
  Future<Employee> getEmployeeByToken();

  @GET("/api/employee/getAll")
  Future<List<Employee>> getAllEmployee();

  @GET("/api/employee/getByUserId/{id}")
  Future<Employee> getEmployeeByUserId(@Path('id') String id);

  @PUT("/api/employee/edit")
  Future<UserApiModel> editEmployee(@Body() UserApiModel userApiModel);

  @DELETE("/api/employee/delete/{id}")
  Future<String> deleteEmployee(@Path('id') String id);

  ///
  /// CLIENT
  ///

  @GET("/api/client/{id}")
  Future<Client> getClient(@Path('id') String id);

  @GET("/api/client/getAll")
  Future<List<Client>> getAllClient();

  @GET("/api/client/getByUserId/{id}")
  Future<Client> getClientByUserId(@Path('id') String id);

  ///
  /// ANIMAL
  ///

  @POST("/api/animal/add")
  Future<Animal> addAnimal(@Body() AnimalApiModel animalApiModel);

  @GET("/api/animal/statistic")
  Future<List<Animal>> getAllAnimal();

  @GET("/api/animal/getByEmployeeId")
  Future<List<Animal>> getAnimalByEmployeeId();

  @GET("/api/animal/get/{id}")
  Future<Animal> getAnimal(@Path('id') String id);

  @GET("/api/animal/care/{id}")
  Future<String> careRecomendation(@Path('id') String id);

  @GET("/api/animal/feed/{id}")
  Future<String> feedRecomendation(@Path('id') String id);

  @PUT("/api/animal/edit{id}")
  Future<Animal> editAnimal(
    @Path('id') String id,
    @Body() AnimalApiModel animalApiModel,
  );

  ///
  /// ACTIVITY
  ///

  @POST("/api/activity/add")
  Future<Activity> addActivity(@Body() ActivityApiModel activityApiModel);

  @GET("/api/activity/get")
  Future<Activity> getActivity(@Body() String activityId);

  @GET("/api/activity/statistic/{id}")
  Future<List<Activity>> getActivityStatistic(@Path('id') String animalId);

  @GET("/api/activity/getByAnimalId/{id}")
  Future<List<Activity>> getActivityByAnimalId(@Path('id') String animalId);

  @PUT("/api/activity/edit/{id}")
  Future<ActivityApiModel> editActivity(
    @Path('id') String id,
    @Body() ActivityApiModel activityApiModel,
  );

  @DELETE("/api/activity/delete/{id}")
  Future<String> deleteActivity(@Path('id') String id);
}

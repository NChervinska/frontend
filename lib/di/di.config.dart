// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/animal_hostel_api_client.dart' as _i7;
import '../api/header_api_interceptor.dart' as _i5;
import '../cubit/activity_cubit/activity_cubit.dart' as _i17;
import '../cubit/activity_statistic_cubit/activity_statistic_cubit.dart'
    as _i18;
import '../cubit/alter_activity_cubit/alter_activity_cubit.dart' as _i19;
import '../cubit/animal_cubit/animal_cubit.dart' as _i20;
import '../cubit/animal_page_cubit/animal_page_cubit.dart' as _i21;
import '../cubit/animal_statistic_cubit/animal_statistic_cubit.dart' as _i22;
import '../cubit/app_control/app_control_cubit.dart' as _i9;
import '../cubit/change_password_cubit/change_password_cubit.dart' as _i10;
import '../cubit/client_cubit/client_cubit.dart' as _i11;
import '../cubit/employee_cubit/employee_cubit.dart' as _i12;
import '../cubit/login_cubit/login_cubit.dart' as _i13;
import '../cubit/register_cubit/register_cubit.dart' as _i14;
import '../cubit/user_cubit/user_cubit.dart' as _i15;
import '../cubit/user_page_cubit/user_page_cubit.dart' as _i16;
import '../service/api_service.dart' as _i8;
import '../service/navigation_service.dart' as _i3;
import '../service/preferences_service.dart' as _i4;
import 'api_module.dart' as _i23; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $configureDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  gh.singleton<_i3.NavigationService>(_i3.NavigationService());
  await gh.factoryAsync<_i4.PreferencesService>(
      () => _i4.PreferencesService.getInstance(),
      preResolve: true);
  gh.factory<_i5.HeaderApiInterceptor>(() => _i5.HeaderApiInterceptor(
      get<_i4.PreferencesService>(), get<_i3.NavigationService>()));
  gh.lazySingleton<_i6.Dio>(
      () => apiModule.dio(get<_i5.HeaderApiInterceptor>()));
  gh.lazySingleton<_i7.AnimalHostelApiClient>(
      () => apiModule.apiClient(get<_i6.Dio>()));
  gh.factory<_i8.ApiService>(
      () => _i8.ApiService(get<_i7.AnimalHostelApiClient>()));
  gh.factory<_i9.AppControlCubit>(() => _i9.AppControlCubit(
      get<_i8.ApiService>(), get<_i4.PreferencesService>()));
  gh.factory<_i10.ChangePasswordCubit>(
      () => _i10.ChangePasswordCubit(get<_i8.ApiService>()));
  gh.factory<_i11.ClientCubit>(() => _i11.ClientCubit(get<_i8.ApiService>()));
  gh.factory<_i12.EmployeeCubit>(
      () => _i12.EmployeeCubit(get<_i8.ApiService>()));
  gh.factory<_i13.LoginCubit>(() =>
      _i13.LoginCubit(get<_i8.ApiService>(), get<_i4.PreferencesService>()));
  gh.factory<_i14.RegisterCubit>(
      () => _i14.RegisterCubit(get<_i8.ApiService>()));
  gh.factory<_i15.UserCubit>(() => _i15.UserCubit(get<_i8.ApiService>()));
  gh.factory<_i16.UserPageCubit>(
      () => _i16.UserPageCubit(get<_i8.ApiService>()));
  gh.factoryParam<_i17.ActivityCubit, String?, dynamic>(
      (animalId, _) => _i17.ActivityCubit(get<_i8.ApiService>(), animalId));
  gh.factory<_i18.ActivityStatisticCubit>(
      () => _i18.ActivityStatisticCubit(get<_i8.ApiService>()));
  gh.factoryParam<_i19.AlterActivityCubit, String?, dynamic>(
      (animal, _) => _i19.AlterActivityCubit(get<_i8.ApiService>(), animal));
  gh.factory<_i20.AnimalCubit>(() => _i20.AnimalCubit(get<_i8.ApiService>()));
  gh.factory<_i21.AnimalPageCubit>(
      () => _i21.AnimalPageCubit(get<_i8.ApiService>()));
  gh.factory<_i22.AnimalStatisticCubit>(
      () => _i22.AnimalStatisticCubit(get<_i8.ApiService>()));
  return get;
}

class _$ApiModule extends _i23.ApiModule {}

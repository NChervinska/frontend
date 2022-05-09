import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api/animal_hostel_api_client.dart';
import '../api/header_api_interceptor.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio dio(HeaderApiInterceptor generalInterceptor) {
    return Dio()
      ..options.sendTimeout = 10000
      ..interceptors.add(generalInterceptor)
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ));
  }

  @lazySingleton
  AnimalHostelApiClient apiClient(Dio dio) => AnimalHostelApiClient(dio);
}

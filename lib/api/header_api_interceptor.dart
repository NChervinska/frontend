import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../service/navigation_service.dart';
import '../service/preferences_service.dart';

@injectable
class HeaderApiInterceptor implements Interceptor {
  final PreferencesService _preferencesService;
  final NavigationService _navigationService;

  HeaderApiInterceptor(
    this._preferencesService,
    this._navigationService,
  );

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldLogOut(err.response?.statusCode)) {
      await _navigationService.navigateToLogin();
      await _preferencesService.logout();
    } else {
      handler.next(err);
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Access-Control-Allow-Headers'] = 'Content-Type';
    final accessToken = _preferencesService.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type');
    handler.next(response);
  }

  bool _shouldLogOut(int? statusCode) {
    if (statusCode == null) return false;
    const logOutStatuses = [401];

    return logOutStatuses.contains(statusCode);
  }
}

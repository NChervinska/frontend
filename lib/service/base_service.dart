import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../api/model/api_exceptions.dart';
import '../di/locator.dart';
import 'navigation_service.dart';
import 'preferences_service.dart';

abstract class BaseService {
  @protected
  final preferencesService = locator<PreferencesService>();
  final navigationService = locator<NavigationService>();

  Future<T> makeErrorParsedCall<T>(AsyncValueGetter<T> callback) async {
    try {
      return await callback();
    } on DioError catch (exception) {
      throw ApiException(message: exception.response?.data['error']);
    } on ApiException {
      rethrow;
    } catch (exception) {
      throw const ApiException(message: 'BaseService Exception');
    }
  }
}

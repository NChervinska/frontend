import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../page/authorization_page.dart';

@Singleton()
class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<dynamic> navigateToLogin() {
    final future = navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => AuthorizationPage.create(),
      ),
    );

    if (future == null) {
      Logger().log(
        Level.error,
        'NavigationService',
        'propable state is null',
      );
      return Future.value();
    }

    return future;
  }
}

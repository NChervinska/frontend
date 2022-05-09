import 'dart:core';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';
import 'locator.dart';

@InjectableInit(
  initializerName: r'$configureDependencies',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() {
  locator.registerSingleton<RouteObserver<Route>>(RouteObserver<Route>());
  return $configureDependencies(locator);
}

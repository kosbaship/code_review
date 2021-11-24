import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

abstract class Compass {
  GlobalKey<NavigatorState> get navigatorKey;

  Future<T?>? replace<T extends Object, TO extends Object>(
    Route<T>? newRoute, {
    TO result,
  });

  Future<T?> push<T extends Object>(Route<T> newRoute);

  void pop<T extends Object>([T result]);
}

@Singleton(as: Compass)
class CompassImpl implements Compass {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<T?>? replace<T extends Object, TO extends Object>(
    Route<T>? newRoute, {
    TO? result,
  }) =>
      navigatorKey.currentState!.pushReplacement(newRoute!, result: result);

  @override
  Future<T?> push<T extends Object>(Route<T> newRoute) =>
      navigatorKey.currentState!.push(newRoute);

  @override
  void pop<T extends Object>([T? result]) =>
      navigatorKey.currentState!.pop(result);
}

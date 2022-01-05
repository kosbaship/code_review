import 'dart:math';

import 'package:flutter/foundation.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class MockApiService {
  final List<String> items = [];

  Future<Either<Exception, List<String>>> getItems() async {
    await createIsolate();
    final showError = Random().nextBool();
    if (showError) {
      return left(_SomethingWrong());
    } else {
      return right(items);
    }
  }

  Future<void> createIsolate() async {
    final List<String> result = await compute(computeMethod, 2);
    result.forEach((element) => items.add(element));
  }

  static Future<List<String>> computeMethod(int seconds) async {
    await Future.delayed(Duration(seconds: seconds));
    return [for (int i = 0; i < 99; i++) 'My List Item nr $i'];
  }
}

class _SomethingWrong implements Exception {
  @override
  String toString() => 'Something went wrong ¯\_(ツ)_/¯';
}

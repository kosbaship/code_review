import 'dart:math';

import 'package:flutter/foundation.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class MockApiService {
  final List<String> items = [];

  Future<Either<Exception, List<String>>> getItems() async {
    await Future.delayed(const Duration(seconds: 1));
    final showError = Random().nextBool();
    if (showError) {
      return left(_SomethingWrong());
    } else {
      await createIsolate();
      return right(items);
    }
  }

  Future<void> createIsolate() async {
    final List<String> result = await compute(computeMethod, items);
    result.forEach((element) => items.add(element));
  }

  static Future<List<String>> computeMethod(List<String> items) async {

    return [for (int i = 0; i < 99 ; i++) 'My List Item nr $i'];//9999999
  }
}

class _SomethingWrong implements Exception {
  @override
  String toString() => 'Something went wrong ¯\_(ツ)_/¯';
}

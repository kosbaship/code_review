import 'dart:math';

import 'package:flutter/foundation.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class MockApiService {
  Future<Either<Exception, List<String>>> getItems() async {
    final List<String> items = [];
    await Future.delayed(const Duration(seconds: 1));
    final showError = Random().nextBool();
    if (showError) {
      return left(_SomethingWrong());
    } else {
      return right(await compute(_mockNetworkRequest, items));
    }
  }

  static List<String> _mockNetworkRequest(List<String> items) {
    return [for (int i = 0; i < 9999999; i++) 'My List Item nr $i']; //9999999
  }
}

class _SomethingWrong implements Exception {
  @override
  String toString() => 'Something went wrong ¯\_(ツ)_/¯';
}

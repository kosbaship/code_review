import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class MockApiService {

  List<String> get items => [for (int i = 0; i < 9999999; i++) 'My List Item nr $i'];

  Future<Either<Exception, List<String>>> getItems() async {
    await Future.delayed(Duration(seconds: 1));
    var showError = Random().nextBool();
    if (showError) {
      return left(Exception('Something went wrong ¯\_(ツ)_/¯'));
    } else
      return right(items);
  }
}

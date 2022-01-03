import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class MockApiService {
  List<String> get items => _generateListItems();

  Future<Either<Exception, List<String>>> getItems() async {
    await Future.delayed(const Duration(seconds: 1));
    final showError = Random().nextBool();
    if (showError) {
      return left(Exception('Something went wrong ¯\_(ツ)_/¯'));
    } else
      return right(items);
  }


  List<String> _generateListItems() =>
      [for (int i = 0; i < 4; i++) 'My List Item nr $i'];
}


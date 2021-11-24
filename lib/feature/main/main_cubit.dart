import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netguru_flutter_template/service/mock_api_service.dart';

@LazySingleton()
class MainCubit extends Cubit<MainState> {
  MockApiService mockApiService;

  MainCubit(this.mockApiService) : super(Init());

  void fetchListItems() async {
    emit(Loading());
    (await mockApiService.getItems()).fold(
      (error) => emit(Error(error)),
      (list) => emit(Fetched(list)),
    );
  }
}

class MainState {}

class Init extends MainState {}

class Loading extends MainState {}

class Fetched extends MainState {
  List<String> list;

  Fetched(this.list);
}

class Error extends MainState {
  Exception error;

  Error(this.error);
}

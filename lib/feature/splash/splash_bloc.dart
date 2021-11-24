import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:netguru_flutter_template/app/routing/compass.dart';

import '../main/main_screen.dart';

@Injectable()
class SplashCubit extends Cubit<SplashState> {
  final Compass _compass;

  SplashCubit(this._compass) : super(SplashInitialState()) {
    _checkAuthorization();
  }

  Future<void> _checkAuthorization() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(SplashAuthorizedState());
    _compass.replace(MainScreenRoute());
  }
}

@immutable
abstract class SplashState extends Equatable {
  @override
  List<Object> get props => [];
}

class SplashInitialState extends SplashState {}

class SplashUnauthorizedState extends SplashState {}

class SplashAuthorizedState extends SplashState {}

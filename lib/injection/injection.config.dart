// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/routing/compass.dart' as _i5;
import '../feature/main/main_cubit.dart' as _i6;
import '../feature/splash/splash_bloc.dart' as _i4;
import '../service/mock_api_service.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.MockApiService>(() => _i3.MockApiService());
  gh.factory<_i4.SplashCubit>(() => _i4.SplashCubit(get<_i5.Compass>()));
  gh.lazySingleton<_i6.MainCubit>(
      () => _i6.MainCubit(get<_i3.MockApiService>()));
  gh.singleton<_i5.Compass>(_i5.CompassImpl());
  return get;
}

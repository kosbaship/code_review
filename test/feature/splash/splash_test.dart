import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netguru_flutter_template/app/routing/compass.dart';
import 'package:netguru_flutter_template/feature/main/main_screen.dart';
import 'package:netguru_flutter_template/feature/splash/splash_bloc.dart';

import '../../mocks.dart';

void main() {
  late Compass compass;

  late SplashCubit splashCubit;

  setUp(() {
    compass = CompassMock();
    splashCubit = SplashCubit(compass);
  });

  tearDown(() {
    splashCubit.close();
  });

  test("Should start with initial state", () {
    expect(splashCubit.state, SplashInitialState());
  });

  blocTest(
    "Should navigate to main screen after authorization is finished",
    build: () => splashCubit,
    act: (SplashCubit bloc) async {
      await Future.delayed(const Duration(seconds: 2));
    },
    expect: () => [SplashAuthorizedState()],
    verify: (_) async {
      final arg = verify(compass.replace(captureAny)).captured;
      assert(arg[0].runtimeType == MainScreenRoute().runtimeType);
    },
  );
}

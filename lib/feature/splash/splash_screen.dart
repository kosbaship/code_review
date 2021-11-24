import 'package:flutter/material.dart';
import 'package:netguru_flutter_template/feature/splash/splash_bloc.dart';
import 'package:netguru_flutter_template/injection/injection.dart';
import 'package:netguru_flutter_template/widget/custom_loading/custom_loading.dart';
import 'package:netguru_flutter_template/values/app_theme.dart';

import '../../values/dimensions.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late SplashCubit _splashCubit;

  @override
  void initState() {
    super.initState();
    _splashCubit = getIt.get();
  }

  @override
  void dispose() {
    _splashCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _body(context),
      );

  Widget _body(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Icon(
              Icons.bug_report,
              size: 150,
              color: context.primaryColor(),
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: CustomLoading(),
            ),
          ],
        ),
      );
}

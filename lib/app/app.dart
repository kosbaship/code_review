import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:netguru_flutter_template/values/app_theme.dart';

import '../feature/splash/splash_screen.dart';
import '../injection/injection.dart';
import 'routing/compass.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: getIt.get<Compass>().navigatorKey,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: SplashScreen(),
      );
}

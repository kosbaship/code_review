import 'package:flutter/material.dart';
import 'package:netguru_flutter_template/injection/injection.dart';

import 'app/app.dart';
import 'app/environment/environment.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(prodEnv.name);
  runApp(App());
}

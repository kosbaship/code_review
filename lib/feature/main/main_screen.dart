import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netguru_flutter_template/app/s.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(S.of(context).appName)),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Hello World!'),
            ],
          ),
        ),
      );
}

class MainScreenRoute extends MaterialPageRoute<bool> {
  MainScreenRoute() : super(builder: (_) => MainScreen());
}

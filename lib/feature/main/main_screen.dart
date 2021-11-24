import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_flutter_template/app/s.dart';
import 'package:netguru_flutter_template/feature/main/main_cubit.dart';
import 'package:netguru_flutter_template/injection/injection.dart';
import 'package:netguru_flutter_template/widget/custom_loading/custom_loading.dart';
import 'package:netguru_flutter_template/values/app_theme.dart';

class MainScreenRoute extends MaterialPageRoute<bool> {
  MainScreenRoute() : super(builder: (_) => MainScreen());
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainCubit? mainCubit;

  bool isLoading = false;

  @override
  void initState() {
    mainCubit = getIt.get<MainCubit>();
    mainCubit?.fetchListItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => mainCubit!,
      child: BlocConsumer<MainCubit, MainState>(
        listener: (BuildContext context, state) {
          setState(() {
            isLoading = state is Loading;
          });
        },
        builder: (BuildContext context, state) => Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).appName),
            backgroundColor: context.primaryColor(),
          ),
          body: Center(
            child: Stack(
              children: [
                state is Loading ? CustomLoading() : SizedBox(),
                state is Error ? Text(state.error.toString()) : SizedBox(),
                if (state is Fetched)
                  ListView(
                      children: state.list.map(
                    (s) {
                      if (state.list.indexOf(s) % 2 == 0)
                        s = 'I dont like even numbers';
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          color: Colors.green,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/splash_image.png',
                                    height: 50,
                                  ),
                                  Text(s),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

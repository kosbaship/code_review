import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netguru_flutter_template/app/s.dart';
import 'package:netguru_flutter_template/feature/main/main_cubit.dart';
import 'package:netguru_flutter_template/injection/injection.dart';
import 'package:netguru_flutter_template/values/app_strings.dart';
import 'package:netguru_flutter_template/values/dimensions.dart';
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
  late final MainCubit mainCubit;

  @override
  void initState() {
    mainCubit = getIt.get<MainCubit>();
    mainCubit.fetchListItems();
    super.initState();
  }

  @override
  void dispose() {
    mainCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => mainCubit,
      child: BlocConsumer<MainCubit, MainState>(
        listener: (BuildContext context, state) {
          if (state is Loading) setState(() {});
        },
        builder: (BuildContext context, state) => Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).appName),
            backgroundColor: context.primaryColor(),
          ),
          body: Center(
            child: Stack(
              children: [
                state is Loading ? CustomLoading() :const SizedBox(),
                state is Error ? Text(state.error.toString()) :const SizedBox(),
                if (state is Fetched)
                  ListView.builder(
                    itemBuilder: (context, index) =>
                        _buildCard(index: index, context: context, state:state),
                    itemCount: state.list.length,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildCard({
  required int index,
  required BuildContext context,
  required Fetched state,
}) =>
    Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
        Radius.circular(Dimensions.SIZE_20),
      )),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(Dimensions.SIZE_8),
        color: context.backgroundColor(),
        child: Stack(
          children: [
            Row(
              children: [
                Image.asset(
                  AppStrings.SPLASH_IMAGE,
                  height: Dimensions.SIZE_50,
                ),
                Text('${state.list[index]}'),
              ],
            ),
          ],
        ),
      ),
    );

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:netguru_flutter_template/service/mock_api_service.dart';

@Injectable()
class MainCubit extends Cubit<MainState> {
  final MockApiService _mockApiService;

  MainCubit(this._mockApiService) : super(Init());

  void fetchListItems() async {
    emit(Loading());
    (await _mockApiService.getItems()).fold(
      (error) => emit(Error(error)),
      (list) async {
        emit(Fetched(await compute(_mappingInDiffIsolate, list)));
      },
    );
  }

  static List<String> _mappingInDiffIsolate(List<String> list) {
    return list.map(
      (s) {
        print('====================');
        print("$s");
        print('====================');
        if (list.indexOf(s) % 2 == 0) {
          s = 'I don\'t like even numbers';
        }
        return s;
      },
    ).toList();
  }
}

@immutable
abstract class MainState {
  const MainState();
}

class Init extends MainState {
  const Init();
}

class Loading extends MainState {
  const Loading();
}

class Fetched extends MainState {
  final List<String> list;

  Fetched(this.list);
}

class Error extends MainState {
  final Exception error;

  Error(this.error);
}

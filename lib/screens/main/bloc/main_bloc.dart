import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) async {
      if (event is StartLoadingEvent) {
        await Future.delayed(const Duration(seconds: 2), () {
          emit(MainLoaded());
        });
      }
    });
  }
}

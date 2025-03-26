import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_bloc/data/network/base/repository.dart';
import 'package:sample_bloc/routes/app_navigate.dart';

/// Event
abstract class AppEvent {}

/// Action
class AppChangeTab extends AppEvent {
  final int index;

  AppChangeTab(this.index);
}

/// State
class AppState {
  final int currentIndex;

  AppState(this.currentIndex);
}

///Bloc
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState(0)) {
    on<AppChangeTab>((event, emit) {
      debugPrint("newIndex = ${event.index} -- currentIndex = ${state.currentIndex}");
      final currentIndex = state.currentIndex;
      final newIndex = event.index;
      if (currentIndex == newIndex) return;
      emit(AppState(event.index));
      debugPrint("newIndex = ${event.index} -- currentIndex = ${state.currentIndex}");
      if (newIndex == 0) {
        NestedNavigate.instance.gotoMenu1();
      } else if (newIndex == 1) {
        NestedNavigate.instance.gotoMenu2();
      }
    });
  }

  void changeTab(int tabIndex) {
    add(AppChangeTab(tabIndex));
  }
}

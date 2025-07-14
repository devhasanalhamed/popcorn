import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/modules/home/controller/home_screen_event.dart';
import 'package:popcorn/modules/home/controller/home_screen_state.dart';
import 'dart:async';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState(index: 0)) {
    on<UpdateHomeScreenIndexEvent>(_updateHomdScreenIndex);
  }

  FutureOr<void> _updateHomdScreenIndex(
      UpdateHomeScreenIndexEvent event, Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(index: event.index));
  }
}

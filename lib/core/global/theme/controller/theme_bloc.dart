import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popcorn/core/global/theme/controller/theme_event.dart';
import 'package:popcorn/core/global/theme/controller/theme_state.dart';
import 'package:popcorn/core/global/theme/domain/usecase/load_theme_data_usecase.dart';
import 'package:popcorn/core/global/theme/domain/usecase/save_theme_data_usecase.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final LoadThemeDataUsecase loadThemeDataUsecase;
  final SaveThemeDataUsecase saveThemeDataUsecase;

  ThemeBloc(
      {required this.loadThemeDataUsecase, required this.saveThemeDataUsecase})
      : super(ThemeState.initial()) {
    on<ChangeThemeEvent>(_changeThemeEvent);
  }

  FutureOr<void> _changeThemeEvent(
      ChangeThemeEvent event, Emitter<ThemeState> emit) async {
    if (state.isDark) {
      emit(state.copyWith(
        isDark: false,
        themeData: ThemeData.light(),
      ));
    } else {
      emit(state.copyWith(
        isDark: true,
        themeData: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
      ));
    }
  }
}

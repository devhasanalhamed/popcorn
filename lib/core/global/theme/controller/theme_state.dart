import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final bool isDark;
  final ThemeData themeData;

  const ThemeState({this.isDark = true, required this.themeData});

  factory ThemeState.initial() => ThemeState(
        themeData: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
      );

  ThemeState copyWith({
    bool? isDark,
    ThemeData? themeData,
  }) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
      themeData: themeData ?? this.themeData,
    );
  }

  @override
  List<Object> get props => [isDark];
}

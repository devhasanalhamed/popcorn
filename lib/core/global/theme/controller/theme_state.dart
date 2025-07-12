import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final bool isDark;
  final ThemeData themeData;

  const ThemeState({this.isDark = false, required this.themeData});

  @override
  List<Object> get props => [isDark];
}

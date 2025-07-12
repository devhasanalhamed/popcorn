// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final bool isDark;
  final ThemeData themeData;

  const ThemeState({this.isDark = false, this.themeData = const ThemeData()});

  @override
  List<Object> get props => [isDark];
}

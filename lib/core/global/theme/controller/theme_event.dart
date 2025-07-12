import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {}

class ChangeTheme extends ThemeEvent {
  @override
  List<Object> get props => [];
}
